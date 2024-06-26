package cn.morefocus.base.module.support.serialnumber.domain.bo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * 单据序列号 生成表单
 */
@Data
public class SerialNumberGenerateForm {

    @Schema(description = "单号ID")
    @NotNull(message = "单号ID不能为空")
    private Long serialNumberId;

    @Schema(description = "生成的数量")
    @NotNull(message = "生成的数量不能为空")
    private Integer count;
}
