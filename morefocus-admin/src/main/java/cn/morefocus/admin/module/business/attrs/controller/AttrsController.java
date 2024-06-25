package cn.morefocus.admin.module.business.attrs.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.morefocus.admin.constants.AdminSwaggerTagConst;
import cn.morefocus.admin.module.business.attrs.domain.form.AttrsAddForm;
import cn.morefocus.admin.module.business.attrs.domain.form.AttrsPageQueryForm;
import cn.morefocus.admin.module.business.attrs.domain.form.AttrsQueryForm;
import cn.morefocus.admin.module.business.attrs.domain.form.AttrsUpdateForm;
import cn.morefocus.admin.module.business.attrs.domain.vo.AttrsVO;
import cn.morefocus.admin.module.business.attrs.service.AttrsService;
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
 * 辅助属性 Controller
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Tag(name = AdminSwaggerTagConst.Business.ATTRS)
@RestController
public class AttrsController {

    @Resource
    private AttrsService attrsService;

    /**
     * 分页查询
     */
    @Operation(summary = "查询分页列表")
    @PostMapping("/attrs/queryPage")
    @SaCheckPermission("business:attrs:query")
    public R<PageResult<AttrsVO>> queryPage(@RequestBody @Valid AttrsPageQueryForm queryForm) {
        return R.ok(attrsService.queryPage(queryForm));
    }

    /**
     * 查询所有
     */
    @PostMapping("/attrs/queryAll")
    @SaCheckPermission("business:unit:query")
    public R<List<AttrsVO>> queryAll(@RequestBody AttrsQueryForm queryForm) {
        return R.ok(attrsService.queryAll(queryForm));
    }

    /**
     * 新增
     */
    @Operation(summary = "新增")
    @PostMapping("/attrs/add")
    @SaCheckPermission("business:unit:add")
    public R<String> add(@RequestBody @Valid AttrsAddForm addForm) {
        return attrsService.add(addForm);
    }

    /**
     * 编辑
     */
    @Operation(summary = "编辑")
    @PostMapping("/attrs/update")
    @SaCheckPermission("business:attrs:update")
    public R<String> update(@RequestBody @Valid AttrsUpdateForm updateForm) {
        return attrsService.update(updateForm);
    }

    /**
     * 批量删除
     */
    @Operation(summary = "批量删除")
    @PostMapping("/attrs/batchDelete")
    @SaCheckPermission("business:attrs:delete")
    public R<String> batchDelete(@RequestBody List<Long> idList) {
        return attrsService.batchDelete(idList);
    }

    /**
     * 删除
     */
    @Operation(summary = "单个删除")
    @PostMapping("/attrs/delete/{id}")
    @SaCheckPermission("business:attrs:delete")
    public R<String> batchDelete(@PathVariable Long id) {
        return attrsService.delete(id);
    }

    /**
     * 更新禁用/启用状态
     */
    @Operation(summary = "更新禁用/启用状态")
    @PostMapping("/attrs/disabled/{id}")
    @SaCheckPermission("business:attrs:disabled")
    public R<String> updateIsDisabled(@PathVariable("id") Long id) {
        return attrsService.updateIsDisabled(id);
    }
}
