package cn.morefocus.admin.module.business.spu.domain.entity;

import cn.morefocus.base.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 商品多单位 实体类
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("t_spu_unit")
public class SpuUnitEntity extends BaseEntity {

    /**
     * ID
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 单位ID
     */
    private Long unitId;

    /**
     * 单位名称
     */
    private String unitName;

    /**
     * 基础单位ID
     */
    private Long basicUnitId;

    /**
     * 基础单位名称
     */
    private String basicUnitName;

    /**
     * 转换关系
     */
    private Integer exchange;

    /**
     * spuId
     */
    private Long spuId;

    /**
     * 启用禁用 true-禁用 false-启用
     */
    private Boolean isDisabled;

    /**
     * 是否基础单位 1-是 0-否
     */
    private Boolean isBasicUnit;
}