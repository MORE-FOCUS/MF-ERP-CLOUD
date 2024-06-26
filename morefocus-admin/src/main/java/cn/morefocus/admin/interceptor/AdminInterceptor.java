package cn.morefocus.admin.interceptor;

import cn.dev33.satoken.annotation.SaIgnore;
import cn.dev33.satoken.exception.SaTokenException;
import cn.dev33.satoken.stp.StpUtil;
import cn.dev33.satoken.strategy.SaStrategy;
import cn.hutool.core.util.StrUtil;
import cn.hutool.extra.servlet.ServletUtil;
import cn.morefocus.admin.module.system.login.domain.RequestEmployee;
import cn.morefocus.admin.module.system.login.service.LoginService;
import cn.morefocus.base.common.annoation.NoNeedLogin;
import cn.morefocus.base.common.code.SystemErrorCode;
import cn.morefocus.base.common.code.UserErrorCode;
import cn.morefocus.base.common.constant.RequestHeaderConst;
import cn.morefocus.base.common.constant.StringConst;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.domain.SystemEnvironment;
import cn.morefocus.base.common.enums.SystemEnvironmentEnum;
import cn.morefocus.base.common.enums.UserTypeEnum;
import cn.morefocus.base.common.util.LocalStringUtils;
import cn.morefocus.base.common.util.ResponseUtil;
import cn.morefocus.base.common.util.SecurityContextHolder;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Method;

/**
 * 拦截器
 */
@Component
@Slf4j
public class AdminInterceptor implements HandlerInterceptor {

    @Resource
    private LoginService loginService;

    @Resource
    private SystemEnvironment systemEnvironment;

    @Value("${sa-token.active-timeout}")
    private long tokenActiveTimeout;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        if (HttpMethod.OPTIONS.toString().equals(request.getMethod())) {
            response.setStatus(HttpStatus.NO_CONTENT.value());
            return false;
        }

        boolean isHandler = handler instanceof HandlerMethod;
        if (!isHandler) {
            return true;
        }

        try {
            //根据token获取用户
            String tokenValue = StpUtil.getTokenValue();
            boolean debugNumberTokenFlag = isDevDebugNumberToken(tokenValue);

            String loginId;
            if (debugNumberTokenFlag) {
                //开发、测试环境，且为数字的话，则表明为 调试临时用户，即需要调用 sa-token switch
                loginId = UserTypeEnum.ADMIN_EMPLOYEE.getValue() + StringConst.COLON + tokenValue;
                StpUtil.switchTo(loginId);
            } else {
                loginId = (String) StpUtil.getLoginIdByToken(tokenValue);
            }

            RequestEmployee requestEmployee = loginService.getLoginEmployee(loginId, request);

            // --------------- 第二步： 校验 登录 ---------------

            Method method = ((HandlerMethod) handler).getMethod();
            NoNeedLogin noNeedLogin = ((HandlerMethod) handler).getMethodAnnotation(NoNeedLogin.class);
            if (noNeedLogin != null) {
                checkActiveTimeout(requestEmployee, debugNumberTokenFlag);
                return true;
            }

            if (requestEmployee == null) {
                ResponseUtil.write(response, R.error(UserErrorCode.LOGIN_STATE_INVALID));
                return false;
            }

            // 检测token 活跃频率
            checkActiveTimeout(requestEmployee, debugNumberTokenFlag);

            // --------------- 第三步： 校验 权限 ---------------
            String storeId = ServletUtil.getHeaderIgnoreCase(request, RequestHeaderConst.SELECTED_STORE);
            log.info("当前门店[{}]", storeId);
            if (LocalStringUtils.isNotBlank(storeId)) {
                requestEmployee.setSelectedStoreId(Long.valueOf(storeId));
            }

            SecurityContextHolder.setRequestUser(requestEmployee);
            if (SaStrategy.instance.isAnnotationPresent.apply(method, SaIgnore.class)) {
                return true;
            }

            // 如果是超级管理员的话，不需要校验权限
            if (requestEmployee.getAdministratorFlag()) {
                return true;
            }

            SaStrategy.instance.checkMethodAnnotation.accept(method);

        } catch (SaTokenException e) {
            /*
             * sa-token 异常状态码
             * 具体请看： https://sa-token.cc/doc.html#/fun/exception-code
             */
            int code = e.getCode();
            if (code == 11041 || code == 11051) {
                ResponseUtil.write(response, R.error(UserErrorCode.NO_PERMISSION));
            } else if (code == 11016) {
                ResponseUtil.write(response, R.error(UserErrorCode.LOGIN_ACTIVE_TIMEOUT));
            } else if (code >= 11011 && code <= 11015) {
                ResponseUtil.write(response, R.error(UserErrorCode.LOGIN_STATE_INVALID));
            } else {
                ResponseUtil.write(response, R.error(UserErrorCode.PARAM_ERROR));
            }
            return false;
        } catch (Throwable e) {
            ResponseUtil.write(response, R.error(SystemErrorCode.SYSTEM_ERROR));
            log.error(e.getMessage(), e);
            return false;
        }

        // 通过验证
        return true;
    }

    /**
     * 检测：token 最低活跃频率（单位：秒），如果 token 超过此时间没有访问系统就会被冻结
     */
    private void checkActiveTimeout(RequestEmployee requestEmployee, boolean debugNumberTokenFlag) {

        // 对于开发环境的 数字 debug token ，不需要检测活跃有效期
        if (debugNumberTokenFlag) {
            return;
        }

        // 用户不在线，也不用检测
        if (requestEmployee == null) {
            return;
        }

        // 小于1 ，也不需要检测
        if (tokenActiveTimeout < 1) {
            return;
        }

        StpUtil.checkActiveTimeout();
        StpUtil.updateLastActiveToNow();
    }

    /**
     * 是否为开发使用的 debug token
     */
    private boolean isDevDebugNumberToken(String token) {
        if (!StrUtil.isNumeric(token)) {
            return false;
        }
        return systemEnvironment.getCurrentEnvironment() == SystemEnvironmentEnum.DEV
                || systemEnvironment.getCurrentEnvironment() == SystemEnvironmentEnum.TEST;
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        // 清除上下文
        SecurityContextHolder.remove();

        // 开发环境，关闭 sa token 的临时切换用户
        if (systemEnvironment.getCurrentEnvironment() == SystemEnvironmentEnum.DEV) {
            StpUtil.endSwitch();
        }
    }

}