package cn.morefocus.base.module.support.quartz.domain.form;

import cn.morefocus.base.common.domain.PageParam;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * 定时任务调度
 */
@Data
public class JobQueryForm extends PageParam {
    @Schema(description = "搜索词")
    private String searchWord;

    @Schema(description = "删除标识", hidden = true)
    private Boolean deleteFlag;

    @Schema(description = "任务状态")
    private Boolean status;
}
