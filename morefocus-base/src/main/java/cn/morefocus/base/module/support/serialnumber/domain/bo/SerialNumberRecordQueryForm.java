package cn.morefocus.base.module.support.serialnumber.domain.bo;

import cn.morefocus.base.common.domain.PageParam;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotNull;

/**
 * 单据序列号 生成记录 查询
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class SerialNumberRecordQueryForm extends PageParam {

    @Schema(description = "单号id")
    @NotNull(message = "单号id不能为空")
    private Integer serialNumberId;
}
