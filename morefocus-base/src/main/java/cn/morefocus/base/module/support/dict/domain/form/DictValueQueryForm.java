package cn.morefocus.base.module.support.dict.domain.form;

import cn.morefocus.base.common.domain.PageParam;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotNull;

/**
 * 字典
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class DictValueQueryForm extends PageParam {

    @Schema(description = "dictKeyId")
    @NotNull(message = "dictKeyId不能为空")
    private Long dictKeyId;

    @Schema(description = "删除标识", hidden = true)
    private Boolean isDeleted;
}