package cn.morefocus.base.module.support.changelog.mapper;

import cn.morefocus.base.module.support.changelog.domain.entity.ChangeLogEntity;
import cn.morefocus.base.module.support.changelog.domain.form.ChangeLogQueryForm;
import cn.morefocus.base.module.support.changelog.domain.vo.ChangeLogVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 系统更新日志 mapper
 *
 *
 */

@Mapper
@Component
public interface ChangeLogMapper extends BaseMapper<ChangeLogEntity> {

    /**
     * 分页 查询
     */
    List<ChangeLogVO> queryPage(Page page, @Param("queryForm") ChangeLogQueryForm queryForm);

    /**
     * 根据版本查询 ChangeLog
     */
    ChangeLogEntity selectByVersion(@Param("version") String version);


}
