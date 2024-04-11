package cn.morefocus.admin.module.system.role.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.morefocus.admin.constant.AdminSwaggerTagConst;
import cn.morefocus.admin.module.system.role.domain.form.RoleDataScopeUpdateForm;
import cn.morefocus.admin.module.system.role.domain.vo.RoleDataScopeVO;
import cn.morefocus.admin.module.system.role.service.RoleDataScopeService;
import cn.morefocus.base.common.domain.R;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

/**
 * 角色的数据权限配置
 */
@RestController
@Tag(name = AdminSwaggerTagConst.System.SYSTEM_ROLE_DATA_SCOPE)
public class RoleDataScopeController {

    @Resource
    private RoleDataScopeService roleDataScopeService;

    @Operation(summary = "获取某角色所设置的数据范围")
    @GetMapping("/role/dataScope/getRoleDataScopeList/{roleId}")
    public R<List<RoleDataScopeVO>> dataScopeListByRole(@PathVariable Long roleId) {
        return roleDataScopeService.getRoleDataScopeList(roleId);
    }

    @Operation(summary = "批量设置某角色数据范围")
    @PostMapping("/role/dataScope/updateRoleDataScopeList")
    @SaCheckPermission("system:role:dataScope:update")
    public R<String> updateRoleDataScopeList(@RequestBody @Valid RoleDataScopeUpdateForm roleDataScopeUpdateForm) {
        return roleDataScopeService.updateRoleDataScopeList(roleDataScopeUpdateForm);
    }

}
