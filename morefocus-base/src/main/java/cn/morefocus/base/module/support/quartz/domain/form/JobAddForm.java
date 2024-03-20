package cn.morefocus.base.module.support.quartz.domain.form;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotBlank;

/**
 * 定时任务调度
 */
@Data
public class JobAddForm {
    /**
     * 任务名称
     */
    @Schema(description = "任务名称")
    @NotBlank(message = "任务名称不能为空")
    @Length(max = 50, message = "任务名称太长了，不能超过50字符")
    private String jobName;

    /**
     * 任务组名
     */
    @Schema(description = "任务组名")
    @NotBlank(message = "任务组名不能为空")
    private String jobGroup;

    /**
     * 调用目标字符串
     */
    @Schema(description = "调用目标字符串")
    @NotBlank(message = "调用目标字符串不能为空")
    private String invokeTarget;

    /**
     * cron执行表达式
     */
    @Schema(description = "cron执行表达式")
    @NotBlank(message = "cron执行表达式不能为空")
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
}
