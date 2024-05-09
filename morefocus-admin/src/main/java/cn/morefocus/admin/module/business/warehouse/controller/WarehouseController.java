package cn.morefocus.admin.module.business.warehouse.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.morefocus.admin.constant.AdminSwaggerTagConst;
import cn.morefocus.admin.module.business.warehouse.domain.form.WarehouseAddForm;
import cn.morefocus.admin.module.business.warehouse.domain.form.WarehousePageQueryForm;
import cn.morefocus.admin.module.business.warehouse.domain.form.WarehouseUpdateForm;
import cn.morefocus.admin.module.business.warehouse.domain.vo.WarehouseVO;
import cn.morefocus.admin.module.business.warehouse.service.WarehouseService;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

/**
 * 仓库 Controller
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Tag(name = AdminSwaggerTagConst.Business.WAREHOUSE)
@RestController
public class WarehouseController {

    @Resource
    private WarehouseService warehouseService;

    /**
     * 分页查询
     */
    @Operation(summary = "查询分页列表")
    @PostMapping("/warehouse/queryPage")
    @SaCheckPermission("business:warehouse:query")
    public R<PageResult<WarehouseVO>> queryPage(@RequestBody @Valid WarehousePageQueryForm queryForm) {
        return R.ok(warehouseService.queryPage(queryForm));
    }

    /**
     * 查询所有
     */
    @PostMapping("/warehouse/queryAll")
    @SaCheckPermission("business:warehouse:query")
    public R<List<WarehouseVO>> queryAll(@RequestBody @Valid WarehousePageQueryForm queryForm) {
        return R.ok(warehouseService.queryAll(queryForm));
    }

    /**
     * 新增
     */
    @Operation(summary = "新增")
    @PostMapping("/warehouse/add")
    @SaCheckPermission("business:warehouse:add")
    public R<String> add(@RequestBody @Valid WarehouseAddForm addForm) {
        return warehouseService.add(addForm);
    }

    /**
     * 编辑
     */
    @Operation(summary = "编辑")
    @PostMapping("/warehouse/update")
    @SaCheckPermission("business:warehouse:update")
    public R<String> update(@RequestBody @Valid WarehouseUpdateForm updateForm) {
        return warehouseService.update(updateForm);
    }

    /**
     * 批量删除
     */
    @Operation(summary = "批量删除")
    @PostMapping("/warehouse/batchDelete")
    @SaCheckPermission("business:warehouse:delete")
    public R<String> batchDelete(@RequestBody List<Long> idList) {
        return warehouseService.batchDelete(idList);
    }

    /**
     * 删除
     */
    @Operation(summary = "单个删除")
    @PostMapping("/warehouse/delete/{id}")
    @SaCheckPermission("business:warehouse:delete")
    public R<String> batchDelete(@PathVariable Long id) {
        return warehouseService.delete(id);
    }

    /**
     * 更新禁用/启用状态
     */
    @Operation(summary = "更新禁用/启用状态")
    @PostMapping("/warehouse/disabled/{id}")
    @SaCheckPermission("business:warehouse:disabled")
    public R<String> updateIsDisabled(@PathVariable("id") Long id) {
        return warehouseService.updateIsDisabled(id);
    }

    /**
     * 更新锁定状态
     */
    @Operation(summary = "更新锁定状态")
    @PostMapping("/warehouse/locked/{id}")
    @SaCheckPermission("business:warehouse:locked")
    public R<String> updateIsLocked(@PathVariable("id") Long id) {
        return warehouseService.updateIsDisabled(id);
    }
}
