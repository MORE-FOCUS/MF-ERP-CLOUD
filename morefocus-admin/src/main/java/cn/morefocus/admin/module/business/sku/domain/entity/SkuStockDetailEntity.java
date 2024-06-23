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
     * 分类id
     */
    @TableId(type = IdType.AUTO)
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
     * spuId
     */
    private Integer spuId;

    /**
     * skuId
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