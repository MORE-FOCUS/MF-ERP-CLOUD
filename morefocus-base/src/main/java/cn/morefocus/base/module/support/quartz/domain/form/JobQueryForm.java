package cn.morefocus.base.module.support.quartz.domain.form;

import cn.morefocus.base.common.domain.PageParam;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 定时任务调度
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class JobQueryForm extends PageParam {

    @Schema(description = "任务状态")
    private Boolean status;
}
