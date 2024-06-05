package cn.morefocus.admin.module.business.barcode.domain.form;

import lombok.Data;

@Data
public class SkuBarcodeForm {
    /**
     * skuId
     */
    private Long skuId;

    /**
     * 商品条形码
     */
    private String barcode;
}
