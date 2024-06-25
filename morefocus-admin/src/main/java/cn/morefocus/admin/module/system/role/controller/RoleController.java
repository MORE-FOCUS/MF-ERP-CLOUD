package cn.morefocus.admin.module.system.role.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.morefocus.admin.constants.AdminSwaggerTagConst;
import cn.morefocus.admin.module.system.role.domain.form.RoleAddForm;
import cn.morefocus.admin.module.system.role.domain.form.RoleQueryForm;
import cn.morefocus.admin.module.system.role.domain.form.RoleUpdateForm;
import cn.morefocus.admin.module.system.role.domain.vo.RoleVO;
import cn.morefocus.admin.module.system.role.service.RoleService;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

/**
 * 角色
 */
@RestController
@Tag(name = AdminSwaggerTagConst.System.SYSTEM_ROLE)
public class RoleController {

    @Resource
    private RoleService roleService;

    @Operation(summary = "查询分页列表")
    @PostMapping("/role/queryPage")
    public PageResult<RoleVO> queryPage(@RequestBody RoleQueryForm queryForm) {
        return roleService.queryPage(queryForm);
    }

    @Operation(summary = "获取所有角色")
    @GetMapping("/role/queryAll")
    public R<List<RoleVO>> queryAll() {
        return roleService.queryAll();
    }

    @Operation(summary = "添加角色")
    @PostMapping("/role/add")
    @SaCheckPermission("system:role:add")
    public R<String> addRole(@Valid @RequestBody RoleAddForm roleAddForm) {
        return roleService.addRole(roleAddForm);
    }

    @Operation(summary = "删除角色")
    @GetMapping("/role/delete/{roleId}")
    @SaCheckPermission("system:role:delete")
    public R<String> deleteRole(@PathVariable Long roleId) {
        return roleService.deleteRole(roleId);
    }

    @Operation(summary = "更新角色")
    @PostMapping("/role/update")
    @SaCheckPermission("system:role:update")
    public R<String> updateRole(@Valid @RequestBody RoleUpdateForm roleUpdateDTO) {
        return roleService.updateRole(roleUpdateDTO);
    }

    @Operation(summary = "获取角色数据")
    @GetMapping("/role/get/{roleId}")
    public R<RoleVO> getRole(@PathVariable("roleId") Long roleId) {
        return roleService.getRoleById(roleId);
    }
}
