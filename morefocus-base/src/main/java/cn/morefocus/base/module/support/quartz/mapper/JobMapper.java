package cn.morefocus.base.module.support.quartz.mapper;

import cn.morefocus.base.module.support.quartz.domain.entity.JobEntity;
import cn.morefocus.base.module.support.quartz.domain.form.JobQueryForm;
import cn.morefocus.base.module.support.quartz.domain.vo.JobVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 调度任务Mapper
 */
@Mapper
@Component
public interface JobMapper extends BaseMapper<JobEntity> {

    /**
     * 分页查询任务列表
     */
    List<JobVO> page(Page<?> page, @Param("query") JobQueryForm form);
}
