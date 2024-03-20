package cn.morefocus.base.module.support.dict.domain.form;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * 字典
 *
 * @author loki
 */
@Data
public class DictKeyUpdateForm extends DictKeyAddForm {

    @Schema(description = "keyId")
    @NotNull(message = "keyId不能为空")
    private Long dictKeyId;
}