package cn.morefocus.admin.module.business.sku.domain.vo;

import cn.morefocus.base.common.domain.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;

/**
 * 库存明细变化日志 列表VO
 *
 * @author loki
 * @date 2024-04-01 00:20:24
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class SkuStockDetailChangeRecordVO extends BaseVO {

    private Integer id;

    /**
     * skuId
     */
    private Integer skuId;

    /**
     * sku库存明细ID
     */
    private Integer skuStockDetailId;

    /**
     * 变动数量
     */
    private BigDecimal changeQuantity;

    /**
     * 变动类型
     */
    private Integer changeType;

}