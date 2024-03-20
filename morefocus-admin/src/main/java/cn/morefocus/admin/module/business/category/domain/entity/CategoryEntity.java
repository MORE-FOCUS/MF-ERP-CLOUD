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
 *
 * @author loki
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
    private Long parentId;

    /**
     * 是否禁用(1-禁用 0-启用)
     */
    private Boolean disabledFlag;
}


