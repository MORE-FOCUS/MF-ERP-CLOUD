package cn.morefocus.admin.module.business.warehouse.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.morefocus.admin.constant.AdminSwaggerTagConst;
import cn.morefocus.admin.module.business.warehouse.domain.form.WarehouseAddForm;
import cn.morefocus.admin.module.business.warehouse.domain.form.WarehouseQueryForm;
import cn.morefocus.admin.module.business.warehouse.domain.form.WarehouseUpdateForm;
import cn.morefocus.admin.module.business.warehouse.domain.vo.WarehouseVO;
import cn.morefocus.admin.module.business.warehouse.service.WarehouseService;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
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
    public R<PageResult<WarehouseVO>> queryPage(@RequestBody @Valid WarehouseQueryForm queryForm) {
        return R.ok(warehouseService.queryPage(queryForm));
    }

    /**
     * 查询所有
     */
    @PostMapping("/warehouse/queryAll")
    @SaCheckPermission("business:warehouse:query")
    public R<List<WarehouseVO>> queryAll() {
        return R.ok(warehouseService.queryAll());
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
}
