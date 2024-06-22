package cn.morefocus.admin.module.business.sku.domain.form;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * 商品属性 添加表单
 */
@Data
public class SkuBarcodeUpdateForm {

    @Schema(description = "商品ID")
    @NotNull(message = "商品ID不能为空")
    private Long spuId;

    /**
     * 是否开启保质期批次
     */
    @Schema(description = "是否开启条形码")
    private Boolean enableBarcode;

    /**
     * 条形码
     */
    private List<SkuBarcodeForm> barcodeList;
}
