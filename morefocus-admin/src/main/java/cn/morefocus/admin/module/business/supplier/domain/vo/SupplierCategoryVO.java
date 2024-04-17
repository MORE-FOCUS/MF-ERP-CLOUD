package cn.morefocus.admin.module.business.supplier.domain.vo;

import cn.morefocus.base.common.domain.BaseVo;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * ERP供应商类别 列表VO
 *
 * @author loki
 * @date 2024-04-09 00:05:10
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class SupplierCategoryVO extends BaseVo {

    private Long id;

    /**
     * 名称
     */
    private String name;

    /**
     * 父节点ID
     */
    private Long pid;

    /**
     * 是否默认 true-默认
     */
    private Boolean isDefault;

    /**
     * 是否禁用 true-禁用 false-启用
     */
    private Boolean disabled;

    /**
     * 层级
     */
    private Integer level;

    /**
     * 是否叶子节点
     */
    private Boolean leaf;

    /**
     * 完整父级路径（英文逗号拼接）
     * 根节点ID,一级ID,二级ID
     */
    private String path;

}