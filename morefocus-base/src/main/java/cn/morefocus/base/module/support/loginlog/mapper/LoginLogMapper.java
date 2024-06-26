package cn.morefocus.base.module.support.loginlog.mapper;

import cn.morefocus.base.module.support.loginlog.domain.LoginLogEntity;
import cn.morefocus.base.module.support.loginlog.domain.LoginLogQueryForm;
import cn.morefocus.base.module.support.loginlog.domain.LoginLogVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 登录日志
 *
 *
 */
@Mapper
@Component
public interface LoginLogMapper extends BaseMapper<LoginLogEntity> {

    /**
     * 分页查询
     *
     * @param page
     * @param queryForm
     * @return LoginLogVO
     */
    List<LoginLogVO> queryByPage(Page page, @Param("query") LoginLogQueryForm queryForm);

    /**
     * 查询上一个登录记录
     *
     * @param userId
     * @param userType
     * @return LoginLogVO
     */
    LoginLogVO queryLastByUserId(@Param("userId") Long userId, @Param("userType") Integer userType, @Param("loginLogResult") Integer loginLogResult);


}
