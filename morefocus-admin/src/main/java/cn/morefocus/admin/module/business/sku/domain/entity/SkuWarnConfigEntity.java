package cn.morefocus.admin.module.business.sku.domain.entity;

import cn.morefocus.base.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;

/**
 * 商品库存预警 实体类
 *
 * @author loki
 * @date 2024-06-23 12:20:59
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("t_sku_warn_config")
public class SkuWarnConfigEntity extends BaseEntity {

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
     * skuId
     */
    private Long skuId;

    /**
     * spuId
     */
    private Long spuId;

    /**
     * 单位ID
     */
    private Long unitId;

    /**
     * 最小库存预警
     */
    private BigDecimal minQuantity;

    /**
     * 最大库存预警
     */
    private BigDecimal maxQuantity;
}