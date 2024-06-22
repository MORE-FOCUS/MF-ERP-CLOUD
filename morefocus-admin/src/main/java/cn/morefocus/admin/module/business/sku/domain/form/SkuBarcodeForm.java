package cn.morefocus.admin.module.business.sku.domain.form;

import lombok.Data;

@Data
public class SkuBarcodeForm {
    /**
     * skuId
     */
    private Long skuId;

    /**
     * spuId
     */
    private Long spuId;

    /**
     * 商品名称
     */
    private String spuName;

    /**
     * 单位ID
     */
    private Long unitId;

    /**
     * 单位名称
     */
    private String unitName;

    /**
     * 商品条形码
     */
    private String barcode;
}
