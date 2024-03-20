package cn.morefocus.base.module.support.quartz.mapper;

import cn.morefocus.base.module.support.quartz.domain.entity.JobLogEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

/**
 * 调度任务日志 Mapper
 */
@Mapper
@Component
public interface JobLogMapper extends BaseMapper<JobLogEntity> {
    /**
     * 清空任务日志
     */
    void cleanAllLog();
}
