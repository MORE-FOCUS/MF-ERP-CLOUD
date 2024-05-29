package cn.morefocus.admin.module.business.sku.domain.form;

import lombok.Data;

@Data
public class SkuForm {
    /**
     * 编码
     */
    private String skuNo;

    /**
     * 属性
     */
    private String attrs;

    /**
     * 组合属性名称 比如:蓝色,M
     */
    private String key;

    /**
     * spuId
     */
    private String spuId;
}
