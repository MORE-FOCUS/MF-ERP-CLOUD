package cn.morefocus.admin.module.business.spu.domain.form;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * 商品单位 添加表单
 */
@Data
public class SpuUnitUpdateForm {

    @Schema(description = "商品ID")
    @NotNull(message = "商品ID不能为空")
    private Long spuId;

    @Schema(description = "是否开启多单位")
    @NotNull(message = "是否开启多单位不能为空")
    private Boolean enableMultiUnit;

    /**
     * 多单位
     */
    private List<SpuUnitForm> multiUnitList;
}
