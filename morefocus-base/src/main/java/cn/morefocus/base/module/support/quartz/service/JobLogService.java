package cn.morefocus.base.module.support.quartz.service;

import cn.morefocus.base.module.support.quartz.domain.entity.JobLogEntity;
import cn.morefocus.base.module.support.quartz.mapper.JobLogMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 定时任务调度日志信息 服务层
 */
@Service
public class JobLogService {
    @Resource
    private JobLogMapper jobLogMapper;

    /**
     * 通过调度任务日志ID查询调度信息
     *
     * @param jobLogId 调度任务日志ID
     * @return 调度任务日志对象信息
     */
    public JobLogEntity selectJobLogById(Long jobLogId) {
        return jobLogMapper.selectById(jobLogId);
    }

    /**
     * 新增任务日志
     *
     * @param jobLog 调度日志信息
     */
    public void addJobLog(JobLogEntity jobLog) {
        jobLogMapper.insert(jobLog);
    }

    /**
     * 批量删除调度日志信息
     *
     * @param logIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteJobLogByIds(List<Long> logIds) {
        return jobLogMapper.deleteBatchIds(logIds);
    }

    /**
     * 删除任务日志
     *
     * @param jobId 调度日志ID
     */
    public int deleteJobLogById(Long jobId) {
        return jobLogMapper.deleteById(jobId);
    }

    /**
     * 清空任务日志
     */
    public void cleanJobLog() {
        jobLogMapper.cleanAllLog();
    }
}
