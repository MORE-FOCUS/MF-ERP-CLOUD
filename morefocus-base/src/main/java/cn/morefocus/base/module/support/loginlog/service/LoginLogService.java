package cn.morefocus.base.module.support.loginlog.service;

import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.enumeration.UserTypeEnum;
import cn.morefocus.base.common.util.PageUtil;
import cn.morefocus.base.module.support.loginlog.constant.LoginLogResultEnum;
import cn.morefocus.base.module.support.loginlog.domain.LoginLogEntity;
import cn.morefocus.base.module.support.loginlog.domain.LoginLogQueryForm;
import cn.morefocus.base.module.support.loginlog.domain.LoginLogVO;
import cn.morefocus.base.module.support.loginlog.mapper.LoginLogMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 登录日志
 *
 *
 */
@Service
@Slf4j
public class LoginLogService {

    @Resource
    private LoginLogMapper loginLogMapper;

    /**
     * @description 分页查询
     */
    public R<PageResult<LoginLogVO>> queryByPage(LoginLogQueryForm queryForm) {
        Page page = PageUtil.convert2PageQuery(queryForm);
        List<LoginLogVO> logList = loginLogMapper.queryByPage(page, queryForm);
        PageResult<LoginLogVO> pageResult = PageUtil.convert2PageResult(page, logList);
        return R.ok(pageResult);
    }

    /**
     * @description 添加
     */
    public void log(LoginLogEntity loginLogEntity) {
        try {
            loginLogMapper.insert(loginLogEntity);
        } catch (Throwable e) {
            log.error(e.getMessage(), e);
        }
    }


    /**
     * 查询上一个登录记录
     *
     * @description 查询上一个登录记录
     */
    public LoginLogVO queryLastByUserId(Long userId, UserTypeEnum userTypeEnum, LoginLogResultEnum loginLogResultEnum) {
        return loginLogMapper.queryLastByUserId(userId, userTypeEnum.getValue(), loginLogResultEnum.getValue());
    }

}
