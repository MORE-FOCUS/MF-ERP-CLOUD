package cn.morefocus.admin.module.system.role.domain.entity;

import cn.morefocus.admin.module.system.datascope.constant.DataScopeTypeEnum;
import cn.morefocus.admin.module.system.datascope.constant.DataScopeViewTypeEnum;
import cn.morefocus.base.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 数据范围与角色关系
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("t_role_data_scope")
public class RoleDataScopeEntity extends BaseEntity {
    /**
     * 主键id
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 数据范围id
     * {@link DataScopeTypeEnum}
     */
    private Integer dataScopeType;

    /**
     * 数据范围类型
     * {@link DataScopeViewTypeEnum}
     */
    private Integer viewType;

    /**
     * 角色id
     */
    private Long roleId;
}
