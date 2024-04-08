package cn.morefocus.base.module.support.quartz.domain.entity;

import cn.morefocus.base.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 定时任务调度表
 *
 *
 */
@EqualsAndHashCode(callSuper = true)
@TableName("t_job")
@Data
public class JobEntity extends BaseEntity {
    /**
     * 任务ID
     */
    @TableId(type = IdType.AUTO)
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
     * cron执行表达式
     */
    private String cronExpression;

    /**
     * 计划执行错误策略（1立即执行 2执行一次 3放弃执行）
     */
    private Integer misfirePolicy;

    /**
     * 是否并发执行（1-允许 0-禁止）
     */
    private Boolean concurrent;

    /**
     * 任务状态（1-正常 0-暂停）
     */
    private Boolean status;


    /**
     * key 任务唯一
     */
    private String code;
}
