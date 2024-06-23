package cn.morefocus.admin.module.business.sku.domain.entity;

import cn.morefocus.base.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;

/**
 * 库存明细变化日志 实体类
 *
 * @author loki
 * @date 2024-04-01 00:20:24
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("t_sku_stock_detail_change_record")
public class SkuStockDetailChangeRecordEntity extends BaseEntity {

    /**
     * id
     */
    @TableId(type = IdType.AUTO)
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