package cn.morefocus.admin.module.system.employee.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.morefocus.admin.constant.AdminSwaggerTagConst;
import cn.morefocus.admin.module.system.employee.domain.form.*;
import cn.morefocus.admin.module.system.employee.domain.vo.EmployeeVO;
import cn.morefocus.admin.module.system.employee.service.EmployeeService;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.util.SecurityContextHolder;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

/**
 * 员工
 */
@RestController
@Tag(name = AdminSwaggerTagConst.System.SYSTEM_EMPLOYEE)
public class EmployeeController {

    @Resource
    private EmployeeService employeeService;

    @Operation(summary = "查询分页列表")
    @PostMapping("/employee/queryPage")
    @SaCheckPermission("system:employee:query")
    public R<PageResult<EmployeeVO>> queryPage(@Valid @RequestBody EmployeePageQueryForm query) {
        return R.ok(employeeService.queryPage(query));
    }

    @Operation(summary = "查询分页列表")
    @PostMapping("/employee/queryAll")
    @SaCheckPermission("system:employee:query")
    public R<List<EmployeeVO>> queryAll(@Valid @RequestBody EmployeeQueryForm query) {
        return employeeService.queryAllEmployee(query.getIsDisabled());
    }

    /**
     * 添加员工(返回添加员工的密码)
     */
    @Operation(summary = "添加")
    @PostMapping("/employee/add")
    @SaCheckPermission("system:employee:add")
    public R<String> addEmployee(@Valid @RequestBody EmployeeAddForm employeeAddForm) {
        return employeeService.addEmployee(employeeAddForm);
    }

    @Operation(summary = "更新")
    @PostMapping("/employee/update")
    @SaCheckPermission("system:employee:update")
    public R<String> updateEmployee(@Valid @RequestBody EmployeeUpdateForm employeeUpdateForm) {
        return employeeService.updateEmployee(employeeUpdateForm);
    }

    /**
     * 更新员工禁用/启用状态
     */
    @Operation(summary = "更新员工禁用/启用状态")
    @GetMapping("/employee/update/disabled/{employeeId}")
    @SaCheckPermission("system:employee:disabled")
    public R<String> updateIsDisabled(@PathVariable Long employeeId) {
        return employeeService.updateIsDisabled(employeeId);
    }

    /**
     * 批量删除员工
     */
    @Operation(summary = "批量删除员工")
    @PostMapping("/employee/update/batch/delete")
    @SaCheckPermission("system:employee:delete")
    public R<String> batchUpdateDeleteFlag(@RequestBody List<Long> employeeIdList) {
        return employeeService.batchUpdateDeleteFlag(employeeIdList);
    }

    /**
     * 批量调整员工部门
     */
    @Operation(summary = "批量调整员工部门")
    @PostMapping("/employee/update/batch/department")
    @SaCheckPermission("system:employee:department:update")
    public R<String> batchUpdateDepartment(@Valid @RequestBody EmployeeBatchUpdateDepartmentForm batchUpdateDepartmentForm) {
        return employeeService.batchUpdateDepartment(batchUpdateDepartmentForm);
    }

    /**
     * 修改密码
     */
    @Operation(summary = "修改密码")
    @PostMapping("/employee/update/password")
    public R<String> updatePassword(@Valid @RequestBody EmployeeUpdatePasswordForm updatePasswordForm) {
        updatePasswordForm.setEmployeeId(SecurityContextHolder.getUserId());
        return employeeService.updatePassword(updatePasswordForm);
    }

    /**
     * 重置员工密码
     */
    @Operation(summary = "重置员工密码")
    @GetMapping("/employee/update/password/reset/{employeeId}")
    @SaCheckPermission("system:employee:password:reset")
    public R<String> resetPassword(@PathVariable Integer employeeId) {
        return employeeService.resetPassword(employeeId);
    }

    /**
     * 查询员工-根据部门id
     */
    @Operation(summary = "查询员工-根据部门ID")
    @GetMapping("/employee/getAllEmployeeByDepartmentId/{deptId}")
    public R<List<EmployeeVO>> getAllEmployeeByDepartmentId(@PathVariable Long deptId) {
        return employeeService.getAllEmployeeByDepartmentId(deptId, Boolean.FALSE);
    }

    /**
     * 查询所有员工
     */
    @Operation(summary = "查询所有员工")
    @GetMapping("/employee/query/all")
    public R<List<EmployeeVO>> queryAllEmployee(@RequestParam(value = "isDisabled", required = false) Boolean isDisabled) {
        return employeeService.queryAllEmployee(isDisabled);
    }
}
