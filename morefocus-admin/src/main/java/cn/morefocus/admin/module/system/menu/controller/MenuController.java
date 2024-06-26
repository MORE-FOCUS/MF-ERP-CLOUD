package cn.morefocus.admin.module.system.menu.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.morefocus.admin.constants.AdminSwaggerTagConst;
import cn.morefocus.admin.module.system.menu.domain.form.MenuAddForm;
import cn.morefocus.admin.module.system.menu.domain.form.MenuUpdateForm;
import cn.morefocus.admin.module.system.menu.domain.vo.MenuTreeVO;
import cn.morefocus.admin.module.system.menu.domain.vo.MenuVO;
import cn.morefocus.admin.module.system.menu.service.MenuService;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.domain.RequestUrlVO;
import cn.morefocus.base.common.util.SecurityContextHolder;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

/**
 * 菜单
 */
@RestController
@Tag(name = AdminSwaggerTagConst.System.SYSTEM_MENU)
public class MenuController {

    @Resource
    private MenuService menuService;

    @Operation(summary = "查询菜单列表")
    @GetMapping("/menu/query")
    public R<List<MenuVO>> queryMenuList() {
        return R.ok(menuService.queryMenuList(null));
    }

    @Operation(summary = "查询菜单详情")
    @GetMapping("/menu/detail/{menuId}")
    public R<MenuVO> getMenuDetail(@PathVariable Long menuId) {
        return menuService.getMenuDetail(menuId);
    }

    @Operation(summary = "查询菜单树")
    @GetMapping("/menu/tree")
    public R<List<MenuTreeVO>> queryMenuTree(@RequestParam("onlyMenu") Boolean onlyMenu) {
        return menuService.queryMenuTree(onlyMenu);
    }

    @Operation(summary = "添加菜单")
    @PostMapping("/menu/add")
    @SaCheckPermission("system:menu:add")
    public R<String> addMenu(@RequestBody @Valid MenuAddForm menuAddForm) {
        menuAddForm.setCreateUserId(SecurityContextHolder.getUserId());
        return menuService.addMenu(menuAddForm);
    }

    @Operation(summary = "更新菜单")
    @PostMapping("/menu/update")
    @SaCheckPermission("system:menu:update")
    public R<String> updateMenu(@RequestBody @Valid MenuUpdateForm menuUpdateForm) {
        menuUpdateForm.setUpdateUserId(SecurityContextHolder.getUserId());
        return menuService.updateMenu(menuUpdateForm);
    }

    @Operation(summary = "批量删除菜单")
    @GetMapping("/menu/batchDelete")
    @SaCheckPermission("system:menu:batchDelete")
    public R<String> batchDeleteMenu(@RequestParam("menuIdList") List<Long> menuIdList) {
        return menuService.batchDeleteMenu(menuIdList, SecurityContextHolder.getUserId(), SecurityContextHolder.getUserName());
    }

    @Operation(summary = "获取所有请求路径")
    @GetMapping("/menu/auth/url")
    public R<List<RequestUrlVO>> getAuthUrl() {
        return menuService.getAuthUrl();
    }

    @Operation(summary = "复制")
    @PostMapping("/menu/copy/{menuId}")
    @SaCheckPermission("system:menu:copy")
    public R<String> copyMenu(@PathVariable("menuId") Long menuId) {
        return menuService.copyMenu(menuId);
    }
}
