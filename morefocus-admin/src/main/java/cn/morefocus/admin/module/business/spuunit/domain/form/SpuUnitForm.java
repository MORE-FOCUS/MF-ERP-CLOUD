package cn.morefocus.admin.module.business.spuunit.domain.form;

import lombok.Data;

/**
 * 单位 新建表单
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Data
public class SpuUnitForm {
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