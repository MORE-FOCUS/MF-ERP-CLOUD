package cn.morefocus.admin.module.tenant.controller;

import cn.morefocus.admin.module.tenant.domain.form.TenantAddForm;
import cn.morefocus.admin.module.tenant.domain.form.TenantQueryForm;
import cn.morefocus.admin.module.tenant.domain.form.TenantUpdateForm;
import cn.morefocus.admin.module.tenant.domain.vo.TenantVO;
import cn.morefocus.admin.module.tenant.service.TenantService;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

/**
 * 租户 Controller
 *
 * @author loki
 * @date 2024-04-09 00:06:01
 */
@RestController
@Tag(name = "")
public class TenantController {

    @Resource
    private TenantService TenantService;

    @Operation(summary = "分页查询 @author loki")
    @PostMapping("/Tenant/queryPage")
    public R<PageResult<TenantVO>> queryPage(@RequestBody @Valid TenantQueryForm queryForm) {
        return R.ok(TenantService.queryPage(queryForm));
    }

    @Operation(summary = "添加 @author loki")
    @PostMapping("/Tenant/add")
    public R<String> add(@RequestBody @Valid TenantAddForm addForm) {
        return TenantService.add(addForm);
    }

    @Operation(summary = "更新 @author loki")
    @PostMapping("/Tenant/update")
    public R<String> update(@RequestBody @Valid TenantUpdateForm updateForm) {
        return TenantService.update(updateForm);
    }

    @Operation(summary = "批量删除 @author loki")
    @PostMapping("/Tenant/batchDelete")
    public R<String> batchDelete(@RequestBody @Validated List<Long> idList) {
        return TenantService.batchDelete(idList);
    }

    @Operation(summary = "单个删除 @author loki")
    @GetMapping("/Tenant/delete/{id}")
    public R<String> batchDelete(@PathVariable Long id) {
        return TenantService.delete(id);
    }
}
