package cn.morefocus.admin.module.business.spu.domain.vo;

import cn.morefocus.base.common.domain.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 单位 列表VO
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class SpuUnitVO extends BaseVO {

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
     * 是否基础单位
     */
    private Boolean isBasicUnit;
}