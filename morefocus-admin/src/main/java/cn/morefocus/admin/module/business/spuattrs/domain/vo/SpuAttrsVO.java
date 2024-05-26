package cn.morefocus.admin.module.business.spuattrs.domain.vo;

import cn.morefocus.base.common.domain.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 商品附加属性 列表VO
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class SpuAttrsVO extends BaseVO {

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
}