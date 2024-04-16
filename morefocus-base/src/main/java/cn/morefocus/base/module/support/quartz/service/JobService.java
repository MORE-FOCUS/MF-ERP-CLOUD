package cn.morefocus.base.module.support.quartz.service;

import cn.morefocus.base.common.code.QuartzErrorCode;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.exception.BusinessException;
import cn.morefocus.base.common.util.LocalBeanUtil;
import cn.morefocus.base.common.util.PageUtil;
import cn.morefocus.base.module.support.quartz.constant.JobConstants;
import cn.morefocus.base.module.support.quartz.domain.entity.JobEntity;
import cn.morefocus.base.module.support.quartz.domain.form.JobAddForm;
import cn.morefocus.base.module.support.quartz.domain.form.JobQueryForm;
import cn.morefocus.base.module.support.quartz.domain.form.JobUpdateForm;
import cn.morefocus.base.module.support.quartz.domain.vo.JobVO;
import cn.morefocus.base.module.support.quartz.mapper.JobMapper;
import cn.morefocus.base.module.support.quartz.util.CronUtils;
import cn.morefocus.base.module.support.quartz.util.ScheduleUtils;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.extern.slf4j.Slf4j;
import org.quartz.JobDataMap;
import org.quartz.JobKey;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.util.List;

/**
 * 定时任务调度信息 服务层
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class JobService {
    @Resource
    private Scheduler scheduler;
    @Resource
    private JobMapper jobMapper;

    /**
     * 项目启动时，初始化定时器 主要是防止手动修改数据库导致未同步到定时任务处理（注：不能手动修改数据库ID和任务组名，否则会导致脏数据）
     */
    @PostConstruct
    public void init() throws SchedulerException {
        scheduler.clear();

        Wrapper<JobEntity> wrapper = new QueryWrapper<JobEntity>()
                .eq("isDeleted", Boolean.FALSE)
                .eq("status", Boolean.TRUE);
        List<JobEntity> jobList = jobMapper.selectList(null);
        for (JobEntity job : jobList) {
            ScheduleUtils.createScheduleJob(scheduler, job);
        }
    }

    /**
     * 获取quartz调度器的计划任务列表
     *
     * @param queryForm 参数
     */
    public PageResult<JobVO> queryPage(JobQueryForm queryForm) {
        Page<?> page = PageUtil.convert2PageQuery(queryForm);
        List<JobVO> jobList = jobMapper.page(page, queryForm);
        return PageUtil.convert2PageResult(page, jobList);
    }

    /**
     * 通过调度任务ID查询调度信息
     *
     * @param jobId 调度任务ID
     * @return 调度任务对象信息
     */
    public JobEntity selectJobById(Long jobId) {
        return jobMapper.selectById(jobId);
    }

    /**
     * 暂停任务
     *
     * @param job 调度信息
     */
    public void pauseJob(JobEntity job) throws SchedulerException {
        job.setStatus(false);
        jobMapper.updateById(job);
        scheduler.pauseJob(ScheduleUtils.getJobKey(job.getJobId(), job.getJobGroup()));
    }

    /**
     * 恢复任务
     */
    public void resumeJob(JobEntity job) throws SchedulerException {
        job.setStatus(true);
        jobMapper.updateById(job);
        scheduler.resumeJob(ScheduleUtils.getJobKey(job.getJobId(), job.getJobGroup()));
    }

    /**
     * 删除任务后，所对应的trigger也将被删除
     */
    public void delete(Long jobId) {
        JobEntity job = jobMapper.selectById(jobId);
        if (null == job) {
            throw new BusinessException(QuartzErrorCode.DATA_NOT_EXIST);
        }

        try {
            scheduler.deleteJob(ScheduleUtils.getJobKey(jobId, job.getJobGroup()));
        } catch (SchedulerException ex) {
            log.info("定时任务删除失败:{}", ex.getMessage());
        }
    }

    /**
     * 批量删除调度信息
     */
    public void batchDelete(List<Long> jobIds) {
        for (Long jobId : jobIds) {
            delete(jobId);
        }
    }

    /**
     * 任务调度状态修改
     */
    public void changeStatus(JobEntity job) throws SchedulerException {
        if (job.getStatus()) {
            pauseJob(job);
        } else {
            resumeJob(job);
        }
    }

    /**
     * 立即运行任务
     */
    public void run(List<Long> jobIds) throws SchedulerException {
        for (Long jobId : jobIds) {
            JobEntity properties = selectJobById(jobId);
            String jobGroup = properties.getJobGroup();

            // 参数
            JobDataMap dataMap = new JobDataMap();
            dataMap.put(JobConstants.TASK_PROPERTIES, properties);
            JobKey jobKey = ScheduleUtils.getJobKey(jobId, jobGroup);
            if (scheduler.checkExists(jobKey)) {
                scheduler.triggerJob(jobKey, dataMap);
            }
        }
    }

    /**
     * 新增任务
     */
    public void add(JobAddForm form) {
        JobEntity job = LocalBeanUtil.copy(form, JobEntity.class);
        jobMapper.insert(job);
        try {
            ScheduleUtils.createScheduleJob(scheduler, job);
        } catch (SchedulerException ex) {
            log.info("定时任务初始化失败:{}", ex.getMessage());
        }
    }

    /**
     * 更新任务的时间表达式
     */
    public void update(JobUpdateForm form) {
        JobEntity properties = selectJobById(form.getJobId());
        if (null == properties) {
            throw new BusinessException(QuartzErrorCode.DATA_NOT_EXIST);
        }

        JobEntity job = LocalBeanUtil.copy(form, JobEntity.class);
        jobMapper.updateById(job);

        try {
            updateSchedulerJob(job, properties.getJobGroup());
        } catch (SchedulerException ex) {
            log.info("定时任务更新失败:{}", ex.getMessage());
        }
    }

    /**
     * 更新任务
     */
    public void updateSchedulerJob(JobEntity job, String jobGroup) throws SchedulerException {
        Long jobId = job.getJobId();
        // 判断是否存在
        JobKey jobKey = ScheduleUtils.getJobKey(jobId, jobGroup);
        if (scheduler.checkExists(jobKey)) {
            // 防止创建时存在数据问题 先移除，然后在执行创建操作
            scheduler.deleteJob(jobKey);
        }
        ScheduleUtils.createScheduleJob(scheduler, job);
    }

    /**
     * 校验cron表达式是否有效
     */
    public boolean checkCronExpressionIsValid(String cronExpression) {
        return CronUtils.isValid(cronExpression);
    }
}
