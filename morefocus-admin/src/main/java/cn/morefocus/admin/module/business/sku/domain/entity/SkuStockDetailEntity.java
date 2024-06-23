package cn.morefocus.admin.module.business.sku.domain.entity;

import cn.morefocus.base.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;

/**
 * 商品库存明细 实体类
 *
 * @author loki
 * @date 2024-06-23 11:57:24
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("t_sku_stock_detail")
public class SkuStockDetailEntity extends BaseEntity {

    /**
     * id
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 门店ID
     */
    private Long storeId;

    /**
     * 仓库ID
     */
    private Long warehouseId;

    /**
     * spuId
     */
    private Long spuId;

    /**
     * skuId
     */
    private Long skuId;

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
    private Long batchId;

    /**
     * sku库存ID
     */
    private Long stockId;

}