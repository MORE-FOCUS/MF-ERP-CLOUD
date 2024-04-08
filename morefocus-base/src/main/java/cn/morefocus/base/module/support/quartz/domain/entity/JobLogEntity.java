package cn.morefocus.base.module.support.quartz.domain.entity;

import cn.morefocus.base.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

/**
 * 定时任务调度日志表
 *
 *
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("t_job_log")
public class JobLogEntity extends BaseEntity {
    /**
     * ID
     */
    @TableId(type = IdType.AUTO)
    private Long jobLogId;

    /**
     * 任务ID
     */
    private Long jobId;

    /**
     * 任务名称
     */
    private String jobName;

    /**
     * 任务组名
     */
    private String jobGroup;

    /**
     * 调用目标字符串
     */
    private String invokeTarget;

    /**
     * 日志信息
     */
    private String jobMessage;

    /**
     * 执行状态（1-正常 0-失败）
     */
    private Boolean status;

    /**
     * 异常信息
     */
    private String exceptionInfo;

    /**
     * 开始时间
     */
    private LocalDateTime startTime;

    /**
     * 停止时间
     */
    private LocalDateTime endTime;
}
