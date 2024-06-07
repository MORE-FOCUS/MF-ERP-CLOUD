package cn.morefocus.admin.module.business.barcode.domain.form;

import lombok.Data;

@Data
public class SpuBarcodeForm {
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
