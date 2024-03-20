package cn.morefocus.admin.module.system.employee.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.morefocus.admin.constant.AdminSwaggerTagConst;
import cn.morefocus.admin.module.system.employee.domain.form.*;
import cn.morefocus.admin.module.system.employee.domain.vo.EmployeeVO;
import cn.morefocus.admin.module.system.employee.service.EmployeeService;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.util.LocalRequestUtil;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

/**
 * 员工
 *
 * @author loki
 */
@RestController
@Tag(name = AdminSwaggerTagConst.System.SYSTEM_EMPLOYEE)
public class EmployeeController {

    @Resource
    private EmployeeService employeeService;

    @PostMapping("/employee/query")
    @Operation(summary = "员工管理查询 @author loki")
    public R<PageResult<EmployeeVO>> query(@Valid @RequestBody EmployeeQueryForm query) {
        return R.ok(employeeService.queryEmployee(query));
    }

    @Operation(summary = "添加员工(返回添加员工的密码) @author loki")
    @PostMapping("/employee/add")
    @SaCheckPermission("system:employee:add")
    public R<String> addEmployee(@Valid @RequestBody EmployeeAddForm employeeAddForm) {
        return employeeService.addEmployee(employeeAddForm);
    }

    @Operation(summary = "更新员工 @author loki")
    @PostMapping("/employee/update")
    @SaCheckPermission("system:employee:update")
    public R<String> updateEmployee(@Valid @RequestBody EmployeeUpdateForm employeeUpdateForm) {
        return employeeService.updateEmployee(employeeUpdateForm);
    }

    @Operation(summary = "更新员工禁用/启用状态 @author loki")
    @GetMapping("/employee/update/disabled/{employeeId}")
    @SaCheckPermission("system:employee:disabled")
    public R<String> updateDisableFlag(@PathVariable Long employeeId) {
        return employeeService.updateDisableFlag(employeeId);
    }

    @Operation(summary = "批量删除员工 @author loki")
    @PostMapping("/employee/update/batch/delete")
    @SaCheckPermission("system:employee:delete")
    public R<String> batchUpdateDeleteFlag(@RequestBody List<Long> employeeIdList) {
        return employeeService.batchUpdateDeleteFlag(employeeIdList);
    }

    @Operation(summary = "批量调整员工部门 @author loki")
    @PostMapping("/employee/update/batch/department")
    @SaCheckPermission("system:employee:department:update")
    public R<String> batchUpdateDepartment(@Valid @RequestBody EmployeeBatchUpdateDepartmentForm batchUpdateDepartmentForm) {
        return employeeService.batchUpdateDepartment(batchUpdateDepartmentForm);
    }

    @Operation(summary = "修改密码 @author loki")
    @PostMapping("/employee/update/password")
    public R<String> updatePassword(@Valid @RequestBody EmployeeUpdatePasswordForm updatePasswordForm) {
        updatePasswordForm.setEmployeeId(LocalRequestUtil.getRequestUserId());
        return employeeService.updatePassword(updatePasswordForm);
    }

    @Operation(summary = "重置员工密码 @author loki")
    @GetMapping("/employee/update/password/reset/{employeeId}")
    @SaCheckPermission("system:employee:password:reset")
    public R<String> resetPassword(@PathVariable Integer employeeId) {
        return employeeService.resetPassword(employeeId);
    }

    @Operation(summary = "查询员工-根据部门id @author loki")
    @GetMapping("/employee/getAllEmployeeByDepartmentId/{deptId}")
    public R<List<EmployeeVO>> getAllEmployeeByDepartmentId(@PathVariable Long deptId) {
        return employeeService.getAllEmployeeByDepartmentId(deptId, Boolean.FALSE);
    }

    @Operation(summary = "查询所有员工 @author loki")
    @GetMapping("/employee/queryAll")
    public R<List<EmployeeVO>> queryAllEmployee(@RequestParam(value = "disabledFlag", required = false) Boolean disabledFlag) {
        return employeeService.queryAllEmployee(disabledFlag);
    }
}
