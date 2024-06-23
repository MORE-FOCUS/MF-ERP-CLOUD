package cn.morefocus.admin.module.business.sku.domain.entity;

import cn.morefocus.base.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;

/**
 * 商品库存 实体类
 *
 * @author loki
 * @date 2024-06-23 11:57:19
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("t_sku_stock")
public class SkuStockEntity extends BaseEntity {

    /**
     * id
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * spuId
     */
    private Long spuId;

    /**
     * skuId
     */
    private Long skuId;

    /**
     * 库存数=库存明细库存数之和
     */
    private BigDecimal quantity;
}