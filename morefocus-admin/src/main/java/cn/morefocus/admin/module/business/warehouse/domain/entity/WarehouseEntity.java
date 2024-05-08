package cn.morefocus.admin.module.business.warehouse.domain.entity;

import cn.morefocus.base.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 仓库 实体类
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("t_warehouse")
public class WarehouseEntity extends BaseEntity {

    /**
     * 分类id
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 编号
     */
    private String code;

    /**
     * 仓库名称
     */
    private String name;

    /**
     * 仓库类目ID
     */
    private Long categoryId;

    /**
     * 默认仓库 1-是
     */
    private Boolean isDefault;

    /**
     * 联系人
     */
    private String contact;

    /**
     * 联系电话
     */
    private String tel;

    /**
     * 是否删除 1-删除 0-未删除
     */
    private Boolean isDeleted;

}