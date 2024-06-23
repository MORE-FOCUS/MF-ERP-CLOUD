package cn.morefocus.admin.module.business.sku.domain.entity;

import cn.morefocus.base.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;

/**
 * 商品初始库存 实体类
 *
 * @author loki
 * @date 2024-06-23 11:57:41
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("t_sku_initial_stock")
public class SkuInitialStockEntity extends BaseEntity {

    /**
     * 分类id
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
     * 单位ID
     */
    private Long unitId;

    /**
     * 单价
     */
    private BigDecimal price;

    /**
     * 初始库存
     */
    private BigDecimal quantity;

    /**
     * 库存ID
     */
    private Long stockId;

    /**
     * sku库存明细ID
     */
    private Long stockDetailId;
}