package cn.morefocus.admin.module.business.unit.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.morefocus.admin.constants.AdminSwaggerTagConst;
import cn.morefocus.admin.module.business.unit.domain.form.UnitAddForm;
import cn.morefocus.admin.module.business.unit.domain.form.UnitPageQueryForm;
import cn.morefocus.admin.module.business.unit.domain.form.UnitQueryForm;
import cn.morefocus.admin.module.business.unit.domain.form.UnitUpdateForm;
import cn.morefocus.admin.module.business.unit.domain.vo.UnitVO;
import cn.morefocus.admin.module.business.unit.service.UnitService;
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
@Tag(name = AdminSwaggerTagConst.Business.UNIT)
@RestController
public class UnitController {

    @Resource
    private UnitService unitService;

    /**
     * 分页查询
     */
    @Operation(summary = "查询分页列表")
    @PostMapping("/unit/queryPage")
    @SaCheckPermission("business:unit:query")
    public R<PageResult<UnitVO>> queryPage(@RequestBody @Valid UnitPageQueryForm queryForm) {
        return R.ok(unitService.queryPage(queryForm));
    }

    /**
     * 查询所有
     */
    @PostMapping("/unit/queryAll")
    @SaCheckPermission("business:unit:query")
    public R<List<UnitVO>> queryAll(@RequestBody UnitQueryForm queryForm) {
        return R.ok(unitService.queryAll(queryForm));
    }

    /**
     * 新增
     */
    @Operation(summary = "新增")
    @PostMapping("/unit/add")
    @SaCheckPermission("business:unit:add")
    public R<String> add(@RequestBody @Valid UnitAddForm addForm) {
        return unitService.add(addForm);
    }

    /**
     * 编辑
     */
    @Operation(summary = "编辑")
    @PostMapping("/unit/update")
    @SaCheckPermission("business:unit:update")
    public R<String> update(@RequestBody @Valid UnitUpdateForm updateForm) {
        return unitService.update(updateForm);
    }

    /**
     * 批量删除
     */
    @Operation(summary = "批量删除")
    @PostMapping("/unit/batchDelete")
    @SaCheckPermission("business:unit:delete")
    public R<String> batchDelete(@RequestBody List<Long> idList) {
        return unitService.batchDelete(idList);
    }

    /**
     * 删除
     */
    @Operation(summary = "单个删除")
    @PostMapping("/unit/delete/{id}")
    @SaCheckPermission("business:unit:delete")
    public R<String> batchDelete(@PathVariable Long id) {
        return unitService.delete(id);
    }

    /**
     * 更新禁用/启用状态
     */
    @Operation(summary = "更新禁用/启用状态")
    @PostMapping("/unit/disabled/{id}")
    @SaCheckPermission("business:unit:disabled")
    public R<String> updateIsDisabled(@PathVariable("id") Long id) {
        return unitService.updateIsDisabled(id);
    }

    /**
     * 更新锁定状态
     */
    @Operation(summary = "更新锁定状态")
    @PostMapping("/unit/locked/{id}")
    @SaCheckPermission("business:unit:locked")
    public R<String> updateIsLocked(@PathVariable("id") Long id) {
        return unitService.updateIsDisabled(id);
    }
}
