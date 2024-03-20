package cn.morefocus.base.module.support.quartz.util;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.date.LocalDateTimeUtil;
import cn.hutool.extra.spring.SpringUtil;
import cn.morefocus.base.common.util.ExceptionUtil;
import cn.morefocus.base.module.support.quartz.constant.JobConstants;
import cn.morefocus.base.module.support.quartz.domain.entity.JobEntity;
import cn.morefocus.base.module.support.quartz.domain.entity.JobLogEntity;
import cn.morefocus.base.module.support.quartz.service.JobLogService;
import org.apache.commons.lang3.StringUtils;
import org.quartz.Job;
import org.quartz.JobExecutionContext;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

/**
 * 抽象quartz调用
 */
public abstract class AbstractQuartzJob implements Job {

    /**
     * 线程本地变量
     */
    private static final ThreadLocal<LocalDateTime> THREAD_LOCAL = new ThreadLocal<>();

    @Override
    public void execute(JobExecutionContext context) {
        JobEntity job = new JobEntity();
        BeanUtil.copyProperties(context.getMergedJobDataMap().get(JobConstants.TASK_PROPERTIES), job);
        try {
            before(context);
            doExecute(context, job);
            after(context, job, null);
        } catch (Exception e) {
            after(context, job, e);
        }
    }

    /**
     * 执行前
     */
    protected void before(JobExecutionContext context) {
        THREAD_LOCAL.set(LocalDateTime.now());
    }

    /**
     * 执行后
     */
    protected void after(JobExecutionContext context, JobEntity job, Exception e) {
        LocalDateTime startTime = THREAD_LOCAL.get();
        THREAD_LOCAL.remove();

        final JobLogEntity jobLog = new JobLogEntity();
        jobLog.setJobName(job.getJobName());
        jobLog.setJobGroup(job.getJobGroup());
        jobLog.setInvokeTarget(job.getInvokeTarget());
        jobLog.setStartTime(startTime);
        jobLog.setEndTime(LocalDateTime.now());
        long runMs = LocalDateTimeUtil.between(jobLog.getEndTime(), jobLog.getStartTime(), ChronoUnit.MILLIS);
        jobLog.setJobMessage(jobLog.getJobName() + " 总共耗时：" + runMs + "毫秒");
        if (e != null) {
            jobLog.setStatus(JobConstants.EXE_STATUS_FALSE);
            String errorMsg = StringUtils.substring(ExceptionUtil.getExceptionMessage(e), 0, 2000);
            jobLog.setExceptionInfo(errorMsg);
        } else {
            jobLog.setStatus(JobConstants.EXE_STATUS_SUCCESS);
        }

        // 写入数据库当中
        SpringUtil.getBean(JobLogService.class).addJobLog(jobLog);
    }

    /**
     * 执行方法，由子类重载
     */
    protected abstract void doExecute(JobExecutionContext context, JobEntity job) throws Exception;
}
