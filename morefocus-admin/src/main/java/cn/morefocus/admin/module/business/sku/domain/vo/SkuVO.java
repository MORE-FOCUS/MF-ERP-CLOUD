package cn.morefocus.admin.module.business.sku.domain.vo;

import lombok.Data;

/**
 * SKU 实体类
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Data
public class SkuVO {
    private Long id;

    /**
     * spuId
     */
    private Long spuId;

    /**
     * 属性 json
     */
    private String attrs;

    /**
     * 组合属性名称
     */
    private String key;

    /**
     * sku编码
     */
    private String skuNo;

    /**
     * sku名称
     */
    private String skuName;
}