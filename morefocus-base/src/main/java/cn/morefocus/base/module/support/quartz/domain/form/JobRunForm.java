package cn.morefocus.base.module.support.quartz.domain.form;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * 定时任务执行请求参数
 */
@Data
public class JobRunForm {
    /**
     * 任务ID
     */
    @Schema(description = "任务ID")
    @NotNull(message = "任务ID不能为空")
    private Long jobId;
}
