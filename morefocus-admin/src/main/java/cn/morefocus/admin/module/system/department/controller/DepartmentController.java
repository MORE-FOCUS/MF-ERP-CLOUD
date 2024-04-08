package cn.morefocus.admin.module.system.department.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.morefocus.admin.constant.AdminSwaggerTagConst;
import cn.morefocus.admin.module.system.department.domain.form.DepartmentAddForm;
import cn.morefocus.admin.module.system.department.domain.form.DepartmentUpdateForm;
import cn.morefocus.admin.module.system.department.domain.vo.DepartmentTreeVO;
import cn.morefocus.admin.module.system.department.domain.vo.DepartmentVO;
import cn.morefocus.admin.module.system.department.service.DepartmentService;
import cn.morefocus.base.common.domain.R;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

/**
 * 部门
 */
@RestController
@Tag(name = AdminSwaggerTagConst.System.SYSTEM_DEPARTMENT)
public class DepartmentController {

    @Resource
    private DepartmentService departmentService;

    @Operation(summary = "查询部门树形列表 ")
    @GetMapping("/department/treeList")
    public R<List<DepartmentTreeVO>> departmentTree() {
        return departmentService.departmentTree();
    }

    @Operation(summary = "添加部门 ")
    @PostMapping("/department/add")
    @SaCheckPermission("system:department:add")
    public R<String> addDepartment(@Valid @RequestBody DepartmentAddForm createDTO) {
        return departmentService.addDepartment(createDTO);
    }

    @Operation(summary = "更新部门 ")
    @PostMapping("/department/update")
    @SaCheckPermission("system:department:update")
    public R<String> updateDepartment(@Valid @RequestBody DepartmentUpdateForm updateDTO) {
        return departmentService.updateDepartment(updateDTO);
    }

    @Operation(summary = "删除部门 ")
    @GetMapping("/department/delete/{deptId}")
    @SaCheckPermission("system:department:delete")
    public R<String> deleteDepartment(@PathVariable Long deptId) {
        return departmentService.deleteDepartment(deptId);
    }

    @Operation(summary = "查询部门列表 ")
    @GetMapping("/department/listAll")
    public R<List<DepartmentVO>> listAll() {
        return R.ok(departmentService.listAll());
    }

}
