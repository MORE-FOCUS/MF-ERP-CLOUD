package cn.morefocus.base.module.support.quartz.util;

import cn.morefocus.base.module.support.quartz.domain.entity.JobEntity;
import org.quartz.JobExecutionContext;

/**
 * 定时任务处理（允许并发执行）
 */
public class QuartzJobExecution extends AbstractQuartzJob {
    @Override
    protected void doExecute(JobExecutionContext context, JobEntity job) throws Exception {
        JobInvokeUtil.invokeMethod(job);
    }
}
