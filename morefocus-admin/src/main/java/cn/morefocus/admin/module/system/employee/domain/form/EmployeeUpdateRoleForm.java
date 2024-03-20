package cn.morefocus.admin.module.system.employee.domain.form;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.List;

/**
 * 员工更新角色
 *
 * @author loki
 */
@Data
public class EmployeeUpdateRoleForm {

    @Schema(description = "员工id")
    @NotNull(message = "员工id不能为空")
    private Long employeeId;

    @Schema(description = "角色ids")
    @Size(max = 99, message = "角色最多99")
    private List<Long> roleIdList;

}
