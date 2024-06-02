package cn.morefocus.admin.module.business.sku.domain.entity;

import cn.morefocus.base.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * SKU 实体类
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("t_sku")
public class SkuEntity extends BaseEntity {

    /**
     * ID
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * spuId
     */
    private Long spuId;

    /**
     * 属性 json
     */
    private String attrs;

    /**
     * 组合属性名称
     */
    private String attrsName;

    /**
     * sku编码
     */
    private String skuNo;

    /**
     * sku名称
     */
    private String skuName;
}