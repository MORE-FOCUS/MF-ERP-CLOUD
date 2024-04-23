package cn.morefocus.admin.module.business.supplier.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.morefocus.admin.constant.AdminSwaggerTagConst;
import cn.morefocus.admin.module.business.supplier.domain.form.SupplierAddForm;
import cn.morefocus.admin.module.business.supplier.domain.form.SupplierQueryForm;
import cn.morefocus.admin.module.business.supplier.domain.form.SupplierUpdateForm;
import cn.morefocus.admin.module.business.supplier.domain.vo.SupplierVO;
import cn.morefocus.admin.module.business.supplier.service.SupplierService;
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
 * 供应商 Controller
 *
 * @author loki
 * @date 2024-04-09 00:04:56
 */
@Tag(name = AdminSwaggerTagConst.Business.SUPPLIER)
@RestController
public class SupplierController {

    @Resource
    private SupplierService supplierService;

    /**
     * 分页查询
     */
    @Operation(summary = "查询分页列表")
    @PostMapping("/supplier/queryPage")
    @SaCheckPermission("business:supplier:query")
    public R<PageResult<SupplierVO>> queryPage(@RequestBody @Valid SupplierQueryForm queryForm) {
        return R.ok(supplierService.queryPage(queryForm));
    }

    /**
     * 查询所有
     */
    @PostMapping("/supplier/queryAll")
    @SaCheckPermission("business:supplier:query")
    public R<PageResult<SupplierVO>> queryAll(@RequestBody @Valid SupplierQueryForm queryForm) {
        return R.ok(supplierService.queryPage(queryForm));
    }

    /**
     * 新增
     */
    @Operation(summary = "新增")
    @PostMapping("/supplier/add")
    @SaCheckPermission("business:supplier:add")
    public R<String> add(@RequestBody @Valid SupplierAddForm addForm) {
        return supplierService.add(addForm);
    }

    /**
     * 编辑
     */
    @Operation(summary = "编辑")
    @PostMapping("/supplier/update")
    @SaCheckPermission("business:supplier:update")
    public R<String> update(@RequestBody @Valid SupplierUpdateForm updateForm) {
        return supplierService.update(updateForm);
    }

    /**
     * 批量删除
     */
    @Operation(summary = "批量删除")
    @PostMapping("/supplier/batchDelete")
    @SaCheckPermission("business:supplier:delete")
    public R<String> batchDelete(@RequestBody List<Long> idList) {
        return supplierService.batchDelete(idList);
    }

    /**
     * 删除
     */
    @Operation(summary = "单个删除")
    @PostMapping("/supplier/delete/{id}")
    @SaCheckPermission("business:supplier:delete")
    public R<String> batchDelete(@PathVariable Long id) {
        return supplierService.delete(id);
    }

    /**
     * 更新员工禁用/启用状态
     */
    @Operation(summary = "更新租户禁用/启用状态")
    @PostMapping("/supplier/disabled/{id}")
    @SaCheckPermission("business:supplier:disabled")
    public R<String> updateDisableFlag(@PathVariable("id") Long id) {
        return supplierService.updateIsDisabled(id);
    }
}
