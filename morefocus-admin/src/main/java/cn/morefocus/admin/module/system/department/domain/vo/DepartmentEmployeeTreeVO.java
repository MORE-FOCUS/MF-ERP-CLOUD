package cn.morefocus.admin.module.system.department.domain.vo;

import cn.morefocus.admin.module.system.employee.domain.vo.EmployeeVO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.List;

/**
 * 部门
 */
@Data
public class DepartmentEmployeeTreeVO extends DepartmentVO {

    @Schema(description = "部门员工列表")
    private List<EmployeeVO> employees;

    @Schema(description = "子部门")
    private List<DepartmentEmployeeTreeVO> children;

}
