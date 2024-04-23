package cn.morefocus.base.module.support.serialnumber.domain.bo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * 单据序列号 生成表单
 */
@Data
public class SerialNumberGenerateOneForm {

    @Schema(description = "单号ID")
    @NotNull(message = "单号ID不能为空")
    private Integer serialNumberId;
}
