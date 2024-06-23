package cn.morefocus.admin.module.business.sku.domain.vo;

import cn.morefocus.base.common.domain.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;

/**
 * 商品库存 列表VO
 *
 * @author loki
 * @date 2024-06-23 11:57:19
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class SkuStockVO extends BaseVO {

    private Integer id;

    /**
     * spuId
     */
    private Integer spuId;

    /**
     * skuId
     */
    private Integer skuId;

    /**
     * 库存数=库存明细库存数之和
     */
    private BigDecimal quantity;
}