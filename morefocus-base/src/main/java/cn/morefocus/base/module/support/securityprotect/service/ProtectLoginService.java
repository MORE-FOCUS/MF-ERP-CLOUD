package cn.morefocus.base.module.support.securityprotect.service;

import cn.hutool.core.date.LocalDateTimeUtil;
import cn.morefocus.base.common.code.UserErrorCode;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.enumeration.UserTypeEnum;
import cn.morefocus.base.common.util.PageUtil;
import cn.morefocus.base.module.support.securityprotect.domain.LoginFailEntity;
import cn.morefocus.base.module.support.securityprotect.domain.LoginFailQueryForm;
import cn.morefocus.base.module.support.securityprotect.domain.LoginFailVO;
import cn.morefocus.base.module.support.securityprotect.mapper.LoginFailMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 三级等保 登录 相关
 */
@Service
public class ProtectLoginService {

    private static final String LOGIN_LOCK_MSG = "您已连续登录失败%s次，账号锁定%s分钟，解锁时间为：%s，请您耐心等待！";

    private static final String LOGIN_FAIL_MSG = "登录名或密码错误！连续登录失败%s次，账号将锁定%s分钟！您还可以再尝试%s次！";

    /**
     * 连续登录失败次数则锁定，-1表示不受限制，可以一直登录
     */
    @Value("${classified-protect.login-max-fail-times}")
    private Integer loginMaxFailTimes;

    /**
     * 连续登录失败锁定时间（单位：秒），-1表示不锁定
     */
    @Value("${classified-protect.login-fail-locked-seconds}")
    private Integer loginFailLockedSeconds;

    @Resource
    private LoginFailMapper loginFailMapper;

    /**
     * 检查是否可以登录
     */
    public R<LoginFailEntity> checkLogin(Long userId, UserTypeEnum userType) {

        // 无需校验
        if (loginMaxFailTimes < 1) {
            return R.ok();
        }

        LoginFailEntity loginFailEntity = loginFailMapper.selectByUserIdAndUserType(userId, userType.getValue());
        if (loginFailEntity == null) {
            return R.ok();
        }

        // 校验次数
        if (loginFailEntity.getLoginFailCount() < loginMaxFailTimes) {
            return R.ok(loginFailEntity);
        }

        // 校验锁定时长
        if (loginFailEntity.getLoginLockBeginTime().plusSeconds(loginFailLockedSeconds).isBefore(LocalDateTime.now())) {
            // 过了锁定时间
            return R.ok(loginFailEntity);
        }

        LocalDateTime unlockTime = loginFailEntity.getLoginLockBeginTime().plusSeconds(loginFailLockedSeconds);
        return R.error(UserErrorCode.LOGIN_FAIL_LOCK, String.format(LOGIN_LOCK_MSG, loginFailEntity.getLoginFailCount(), loginFailLockedSeconds / 60, LocalDateTimeUtil.formatNormal(unlockTime)));
    }

    /**
     * 登录失败后记录
     */
    public String recordLoginFail(Long userId, UserTypeEnum userType, String loginName, LoginFailEntity loginFailEntity) {

        // 无需校验
        if (loginMaxFailTimes < 1) {
            return null;
        }

        if (loginFailEntity == null) {
            loginFailEntity = LoginFailEntity.builder()
                    .userId(userId)
                    .userType(userType.getValue())
                    .loginName(loginName)
                    .loginFailCount(1)
                    .lockFlag(false)
                    .loginLockBeginTime(null).build();
            loginFailMapper.insert(loginFailEntity);
        } else {

            // 如果是已经锁定状态，则重新计算
            if (loginFailEntity.getLockFlag()) {
                loginFailEntity.setLockFlag(false);
                loginFailEntity.setLoginFailCount(1);
                loginFailEntity.setLoginLockBeginTime(null);
            } else {
                loginFailEntity.setLoginLockBeginTime(LocalDateTime.now());
                loginFailEntity.setLoginFailCount(loginFailEntity.getLoginFailCount() + 1);
                loginFailEntity.setLockFlag(loginFailEntity.getLoginFailCount() >= loginMaxFailTimes);
            }

            loginFailEntity.setLoginName(loginName);
            loginFailMapper.updateById(loginFailEntity);
        }

        // 提示信息
        if (loginFailEntity.getLoginFailCount() >= loginMaxFailTimes) {
            LocalDateTime unlockTime = loginFailEntity.getLoginLockBeginTime().plusSeconds(loginFailLockedSeconds);
            return String.format(LOGIN_LOCK_MSG, loginFailEntity.getLoginFailCount(), loginFailLockedSeconds / 60, LocalDateTimeUtil.formatNormal(unlockTime));
        } else {
            return String.format(LOGIN_FAIL_MSG, loginMaxFailTimes, loginFailLockedSeconds / 60, loginMaxFailTimes - loginFailEntity.getLoginFailCount());
        }
    }

    /**
     * 清除登录失败
     */
    public void removeLoginFail(Long userId, UserTypeEnum userType) {
        // 无需校验
        if (loginMaxFailTimes < 1) {
            return;
        }

        loginFailMapper.deleteByUserIdAndUserType(userId, userType.getValue());
    }

    /**
     * 分页查询
     */
    public PageResult<LoginFailVO> queryPage(LoginFailQueryForm queryForm) {
        Page<?> page = PageUtil.convert2PageQuery(queryForm);
        List<LoginFailVO> list = loginFailMapper.queryPage(page, queryForm);
        PageResult<LoginFailVO> pageResult = PageUtil.convert2PageResult(page, list);
        return pageResult;
    }

    /**
     * 批量删除
     */
    public R<String> batchDelete(List<Long> idList) {
        if (CollectionUtils.isEmpty(idList)) {
            return R.ok();
        }

        loginFailMapper.deleteBatchIds(idList);
        return R.ok();
    }
}