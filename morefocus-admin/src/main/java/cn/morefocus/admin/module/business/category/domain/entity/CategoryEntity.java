package cn.morefocus.admin.module.business.category.domain.entity;

import cn.morefocus.admin.module.business.category.constant.CategoryTypeEnum;
import cn.morefocus.base.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 类目 实体类
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("t_category")
public class CategoryEntity extends BaseEntity {

    @TableId(type = IdType.AUTO)
    private Long categoryId;

    /**
     * 类目名称
     */
    private String categoryName;

    /**
     * 类目 类型
     *
     * @see CategoryTypeEnum
     */
    private Integer categoryType;

    /**
     * 父级类目id
     */
    private Long pid;

    /**
     * 是否禁用(1-禁用 0-启用)
     */
    private Boolean isDisabled;

    /**
     * 是否默认 true-默认
     */
    private Boolean isDefault;

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


