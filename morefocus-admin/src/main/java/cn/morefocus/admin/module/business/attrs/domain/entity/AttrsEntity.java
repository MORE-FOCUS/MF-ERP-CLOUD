package cn.morefocus.admin.module.business.attrs.domain.entity;

import cn.morefocus.base.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * SPU属性 实体类
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("t_attrs")
public class AttrsEntity extends BaseEntity {

    /**
     * 分类id
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 仓库名称
     */
    private String name;

    /**
     * 禁用状态 1-禁用 0-启用
     */
    private Boolean isDisabled;

    /**
     * 类目ID
     */
    private Long categoryId;
}