package cn.morefocus.base.module.support.dict.domain.form;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * 字典
 *
 *
 */
@Data
public class DictValueUpdateForm extends DictValueAddForm {

    @Schema(description = "valueId")
    @NotNull(message = "valueId不能为空")
    private Long dictValueId;
}