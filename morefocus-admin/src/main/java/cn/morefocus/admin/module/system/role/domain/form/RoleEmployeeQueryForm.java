package cn.morefocus.admin.module.system.role.domain.form;

import cn.morefocus.base.common.domain.PageParam;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 角色的员工查询
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class RoleEmployeeQueryForm extends PageParam {
    @Schema(description = "角色id")
    private String roleId;
}
