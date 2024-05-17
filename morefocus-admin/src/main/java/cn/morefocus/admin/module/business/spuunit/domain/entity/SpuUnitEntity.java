package cn.morefocus.admin.module.business.spuunit.domain.entity;

import cn.morefocus.base.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 单位 实体类
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("t_unit")
public class SpuUnitEntity extends BaseEntity {

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
     * 是否删除 1-删除 0-未删除
     */
    private Boolean isDeleted;

    /**
     * 禁用状态 1-禁用 0-启用
     */
    private Boolean isDisabled;
}