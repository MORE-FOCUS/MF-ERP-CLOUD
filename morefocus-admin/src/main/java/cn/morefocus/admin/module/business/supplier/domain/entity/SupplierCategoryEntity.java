package cn.morefocus.admin.module.business.supplier.domain.entity;

import cn.morefocus.base.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * ERP供应商类别 实体类
 *
 * @author loki
 * @date 2024-04-09 00:05:10
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("t_supplier_category")
public class SupplierCategoryEntity extends BaseEntity {

    /**
     * 分类id
     */
    @TableId(type = IdType.AUTO)
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
    private Boolean isDisabled;

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