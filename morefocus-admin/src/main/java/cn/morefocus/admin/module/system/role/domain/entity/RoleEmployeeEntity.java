package cn.morefocus.admin.module.system.role.domain.entity;

import cn.morefocus.base.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 角色 员工关系
 *
 * @author loki
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("t_role_employee")
public class RoleEmployeeEntity extends BaseEntity {

    @TableId(type = IdType.AUTO)
    private Long id;

    private Long roleId;

    private Long employeeId;

    public RoleEmployeeEntity() {
    }

    public RoleEmployeeEntity(Long roleId, Long employeeId) {
        this.roleId = roleId;
        this.employeeId = employeeId;
    }
}
