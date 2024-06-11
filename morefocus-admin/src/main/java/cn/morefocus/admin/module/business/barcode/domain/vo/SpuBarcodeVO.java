package cn.morefocus.admin.module.business.barcode.domain.vo;

import cn.morefocus.base.common.domain.BaseVO;
import lombok.Data;

/**
 * 条形码 实体类
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Data
public class SpuBarcodeVO extends BaseVO {
    private Long id;

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