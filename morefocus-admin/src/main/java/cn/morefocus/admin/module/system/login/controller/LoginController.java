package cn.morefocus.admin.module.system.login.controller;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.extra.servlet.ServletUtil;
import cn.morefocus.admin.constants.AdminSwaggerTagConst;
import cn.morefocus.admin.module.system.login.domain.LoginForm;
import cn.morefocus.admin.module.system.login.domain.LoginResultVO;
import cn.morefocus.admin.module.system.login.domain.RequestEmployee;
import cn.morefocus.admin.module.system.login.service.LoginService;
import cn.morefocus.base.common.annoation.NoNeedLogin;
import cn.morefocus.base.common.constant.RequestHeaderConst;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.util.SecurityContextHolder;
import cn.morefocus.base.module.support.captcha.domain.CaptchaVO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

/**
 * 员工登录
 */
@RestController
@Tag(name = AdminSwaggerTagConst.System.SYSTEM_LOGIN)
public class LoginController {

    @Resource
    private LoginService loginService;

    @NoNeedLogin
    @PostMapping("/login")
    @Operation(summary = "登录")
    public R<LoginResultVO> login(@Valid @RequestBody LoginForm loginForm, HttpServletRequest request) {
        String ip = ServletUtil.getClientIP(request);
        String userAgent = ServletUtil.getHeaderIgnoreCase(request, RequestHeaderConst.USER_AGENT);
        return loginService.login(loginForm, ip, userAgent);
    }

    @GetMapping("/login/getLoginInfo")
    @Operation(summary = "获取登录结果信息 ")
    public R<LoginResultVO> getLoginInfo() {
        LoginResultVO loginResult = loginService.getLoginResult((RequestEmployee) SecurityContextHolder.getRequestUser());
        String tokenValue = StpUtil.getTokenValue();
        loginResult.setToken(tokenValue);
        return R.ok(loginResult);
    }

    @Operation(summary = "退出登陆 ")
    @GetMapping("/login/logout")
    public R<String> logout(@RequestHeader(value = RequestHeaderConst.TOKEN, required = false) String token) {
        return loginService.logout(token, SecurityContextHolder.getRequestUser());
    }

    @Operation(summary = "获取验证码 ")
    @GetMapping("/login/getCaptcha")
    @NoNeedLogin
    public R<CaptchaVO> getCaptcha() {
        return loginService.getCaptcha();
    }

}
