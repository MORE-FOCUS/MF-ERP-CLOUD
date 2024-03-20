package cn.morefocus.base.module.support.quartz.util;

import cn.morefocus.base.module.support.quartz.domain.entity.JobEntity;
import org.quartz.DisallowConcurrentExecution;
import org.quartz.JobExecutionContext;

/**
 * 定时任务处理（禁止并发执行）
 */
@DisallowConcurrentExecution
public class QuartzDisallowConcurrentExecution extends AbstractQuartzJob {
    @Override
    protected void doExecute(JobExecutionContext context, JobEntity job) throws Exception {
        JobInvokeUtil.invokeMethod(job);
    }
}
