package cn.morefocus.admin.module.business.sku.domain.vo;

import cn.morefocus.base.common.domain.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;

/**
 * 商品库存明细 列表VO
 *
 * @author loki
 * @date 2024-06-23 11:57:24
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class SkuStockDetailVO extends BaseVO {

    private Integer id;

    /**
     * 门店ID
     */
    private Integer storeId;

    /**
     * 仓库ID
     */
    private Integer warehouseId;

    /**
     * spuid
     */
    private Integer spuId;

    /**
     * skuid
     */
    private Integer skuId;

    /**
     * 数量
     */
    private BigDecimal quantity;

    /**
     * 单价
     */
    private BigDecimal price;

    /**
     * 入库批次ID
     */
    private Integer batchId;

    /**
     * sku库存ID
     */
    private Integer stockId;

}