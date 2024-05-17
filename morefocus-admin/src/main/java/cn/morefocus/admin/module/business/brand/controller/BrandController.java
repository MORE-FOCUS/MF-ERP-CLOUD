package cn.morefocus.admin.module.business.brand.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.morefocus.admin.constant.AdminSwaggerTagConst;
import cn.morefocus.admin.module.business.brand.domain.form.BrandAddForm;
import cn.morefocus.admin.module.business.brand.domain.form.BrandPageQueryForm;
import cn.morefocus.admin.module.business.brand.domain.form.BrandQueryForm;
import cn.morefocus.admin.module.business.brand.domain.form.BrandUpdateForm;
import cn.morefocus.admin.module.business.brand.domain.vo.BrandVO;
import cn.morefocus.admin.module.business.brand.service.BrandService;
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
 * 品牌 Controller
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Tag(name = AdminSwaggerTagConst.Business.BRAND)
@RestController
public class BrandController {

    @Resource
    private BrandService brandService;

    /**
     * 分页查询
     */
    @Operation(summary = "查询分页列表")
    @PostMapping("/brand/queryPage")
    @SaCheckPermission("business:brand:query")
    public R<PageResult<BrandVO>> queryPage(@RequestBody @Valid BrandPageQueryForm queryForm) {
        return R.ok(brandService.queryPage(queryForm));
    }

    /**
     * 查询所有
     */
    @PostMapping("/brand/queryAll")
    @SaCheckPermission("business:brand:query")
    public R<List<BrandVO>> queryAll(@RequestBody BrandQueryForm queryForm) {
        return R.ok(brandService.queryAll(queryForm));
    }

    /**
     * 新增
     */
    @Operation(summary = "新增")
    @PostMapping("/brand/add")
    @SaCheckPermission("business:brand:add")
    public R<String> add(@RequestBody @Valid BrandAddForm addForm) {
        return brandService.add(addForm);
    }

    /**
     * 编辑
     */
    @Operation(summary = "编辑")
    @PostMapping("/brand/update")
    @SaCheckPermission("business:brand:update")
    public R<String> update(@RequestBody @Valid BrandUpdateForm updateForm) {
        return brandService.update(updateForm);
    }

    /**
     * 批量删除
     */
    @Operation(summary = "批量删除")
    @PostMapping("/brand/batchDelete")
    @SaCheckPermission("business:brand:delete")
    public R<String> batchDelete(@RequestBody List<Long> idList) {
        return brandService.batchDelete(idList);
    }

    /**
     * 删除
     */
    @Operation(summary = "单个删除")
    @PostMapping("/brand/delete/{id}")
    @SaCheckPermission("business:brand:delete")
    public R<String> batchDelete(@PathVariable Long id) {
        return brandService.delete(id);
    }

    /**
     * 更新禁用/启用状态
     */
    @Operation(summary = "更新禁用/启用状态")
    @PostMapping("/brand/disabled/{id}")
    @SaCheckPermission("business:brand:disabled")
    public R<String> updateIsDisabled(@PathVariable("id") Long id) {
        return brandService.updateIsDisabled(id);
    }

    /**
     * 更新锁定状态
     */
    @Operation(summary = "更新锁定状态")
    @PostMapping("/brand/locked/{id}")
    @SaCheckPermission("business:brand:locked")
    public R<String> updateIsLocked(@PathVariable("id") Long id) {
        return brandService.updateIsDisabled(id);
    }
}
