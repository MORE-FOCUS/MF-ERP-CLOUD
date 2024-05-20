package cn.morefocus.admin.module.business.spuunit.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.morefocus.admin.constant.AdminSwaggerTagConst;
import cn.morefocus.admin.module.business.spuunit.domain.form.SpuUnitAddForm;
import cn.morefocus.admin.module.business.spuunit.domain.form.SpuUnitPageQueryForm;
import cn.morefocus.admin.module.business.spuunit.domain.form.SpuUnitQueryForm;
import cn.morefocus.admin.module.business.spuunit.domain.form.SpuUnitUpdateForm;
import cn.morefocus.admin.module.business.spuunit.domain.vo.SpuUnitVO;
import cn.morefocus.admin.module.business.spuunit.service.SpuUnitService;
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
 * 单位 Controller
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Tag(name = AdminSwaggerTagConst.Business.SPU_UNIT)
@RestController
public class SpuUnitController {

    @Resource
    private SpuUnitService spuUnitService;

    /**
     * 分页查询
     */
    @Operation(summary = "查询分页列表")
    @PostMapping("/spu-unit/queryPage")
    @SaCheckPermission("business:unit:query")
    public R<PageResult<SpuUnitVO>> queryPage(@RequestBody @Valid SpuUnitPageQueryForm queryForm) {
        return R.ok(spuUnitService.queryPage(queryForm));
    }

    /**
     * 查询所有
     */
    @PostMapping("/spu-unit/queryAll")
    @SaCheckPermission("business:unit:query")
    public R<List<SpuUnitVO>> queryAll(@RequestBody SpuUnitQueryForm queryForm) {
        return R.ok(spuUnitService.queryAll(queryForm));
    }

    /**
     * 新增
     */
    @Operation(summary = "新增")
    @PostMapping("/spu-unit/add")
    @SaCheckPermission("business:unit:add")
    public R<String> add(@RequestBody @Valid SpuUnitAddForm addForm) {
        return spuUnitService.add(addForm);
    }

    /**
     * 编辑
     */
    @Operation(summary = "编辑")
    @PostMapping("/spu-unit/update")
    @SaCheckPermission("business:unit:update")
    public R<String> update(@RequestBody @Valid SpuUnitUpdateForm updateForm) {
        return spuUnitService.update(updateForm);
    }

    /**
     * 批量删除
     */
    @Operation(summary = "批量删除")
    @PostMapping("/spu-unit/batchDelete")
    @SaCheckPermission("business:unit:delete")
    public R<String> batchDelete(@RequestBody List<Long> idList) {
        return spuUnitService.batchDelete(idList);
    }

    /**
     * 删除
     */
    @Operation(summary = "单个删除")
    @PostMapping("/spu-unit/delete/{id}")
    @SaCheckPermission("business:unit:delete")
    public R<String> batchDelete(@PathVariable Long id) {
        return spuUnitService.delete(id);
    }

    /**
     * 更新禁用/启用状态
     */
    @Operation(summary = "更新禁用/启用状态")
    @PostMapping("/spu-unit/disabled/{id}")
    @SaCheckPermission("business:unit:disabled")
    public R<String> updateIsDisabled(@PathVariable("id") Long id) {
        return spuUnitService.updateIsDisabled(id);
    }

    /**
     * 更新锁定状态
     */
    @Operation(summary = "更新锁定状态")
    @PostMapping("/spu-unit/locked/{id}")
    @SaCheckPermission("business:unit:locked")
    public R<String> updateIsLocked(@PathVariable("id") Long id) {
        return spuUnitService.updateIsDisabled(id);
    }
}
