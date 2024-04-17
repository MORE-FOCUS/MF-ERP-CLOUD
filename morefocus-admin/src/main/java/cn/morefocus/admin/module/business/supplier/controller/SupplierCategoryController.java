package cn.morefocus.admin.module.business.supplier.controller;

import cn.morefocus.admin.constant.AdminSwaggerTagConst;
import cn.morefocus.admin.module.business.supplier.domain.form.SupplierCategoryAddForm;
import cn.morefocus.admin.module.business.supplier.domain.form.SupplierCategoryQueryForm;
import cn.morefocus.admin.module.business.supplier.domain.form.SupplierCategoryUpdateForm;
import cn.morefocus.admin.module.business.supplier.domain.vo.SupplierCategoryVO;
import cn.morefocus.admin.module.business.supplier.service.SupplierCategoryService;
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
 * ERP供应商类别 Controller
 *
 * @author loki
 * @date 2024-04-09 00:05:10
 */
@Tag(name = AdminSwaggerTagConst.Business.SUPPLIER_CATEGORY)
@RestController
public class SupplierCategoryController {

    @Resource
    private SupplierCategoryService supplierCategoryService;

    /**
     * 分页查询
     */
    @Operation(summary = "查询分页列表")
    @PostMapping("/supplier/category/queryPage")
    public R<PageResult<SupplierCategoryVO>> queryPage(@RequestBody @Valid SupplierCategoryQueryForm queryForm) {
        return R.ok(supplierCategoryService.queryPage(queryForm));
    }

    /**
     * 查询所有
     */
    @PostMapping("/supplier/category/queryAll")
    public R<List<SupplierCategoryVO>> queryAll() {
        return R.ok(supplierCategoryService.queryAll());
    }

    /**
     * 新增
     */
    @Operation(summary = "新增")
    @PostMapping("/supplier/category/add")
    public R<String> add(@RequestBody @Valid SupplierCategoryAddForm addForm) {
        return supplierCategoryService.add(addForm);
    }

    /**
     * 编辑
     */
    @Operation(summary = "编辑")
    @PostMapping("/supplier/category/update")
    public R<String> update(@RequestBody @Valid SupplierCategoryUpdateForm updateForm) {
        return supplierCategoryService.update(updateForm);
    }

    /**
     * 批量删除
     */
    @Operation(summary = "批量删除")
    @PostMapping("/supplier/category/batchDelete")
    public R<String> batchDelete(@RequestBody List<Long> idList) {
        return supplierCategoryService.batchDelete(idList);
    }

    /**
     * 删除
     */
    @Operation(summary = "单个删除")
    @PostMapping("/supplier/category/delete/{id}")
    public R<String> batchDelete(@PathVariable Long id) {
        return supplierCategoryService.delete(id);
    }
}
