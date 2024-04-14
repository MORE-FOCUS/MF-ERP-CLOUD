package cn.morefocus.admin.module.business.tenant.controller;

import cn.morefocus.admin.constant.AdminSwaggerTagConst;
import cn.morefocus.admin.module.business.tenant.domain.form.TenantAddForm;
import cn.morefocus.admin.module.business.tenant.domain.form.TenantQueryForm;
import cn.morefocus.admin.module.business.tenant.domain.form.TenantRegisterForm;
import cn.morefocus.admin.module.business.tenant.domain.form.TenantUpdateForm;
import cn.morefocus.admin.module.business.tenant.domain.vo.TenantVO;
import cn.morefocus.admin.module.business.tenant.service.TenantService;
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
@Tag(name = AdminSwaggerTagConst.Business.TENANT)
public class TenantController {

    @Resource
    private TenantService tenantService;

    @Operation(summary = "分页查询")
    @PostMapping("/tenant/queryPage")
    public R<PageResult<TenantVO>> queryPage(@RequestBody @Valid TenantQueryForm queryForm) {
        return R.ok(tenantService.queryPage(queryForm));
    }

    @Operation(summary = "新增")
    @PostMapping("/tenant/add")
    public R<String> add(@RequestBody @Valid TenantAddForm addForm) {
        return tenantService.add(addForm);
    }

    @Operation(summary = "更新")
    @PostMapping("/tenant/update")
    public R<String> update(@RequestBody @Valid TenantUpdateForm updateForm) {
        return tenantService.update(updateForm);
    }

    @Operation(summary = "批量删除")
    @PostMapping("/tenant/batchDelete")
    public R<String> batchDelete(@RequestBody @Validated List<Long> idList) {
        return tenantService.batchDelete(idList);
    }

    @Operation(summary = "单个删除")
    @GetMapping("/tenant/delete/{id}")
    public R<String> batchDelete(@PathVariable Long id) {
        return tenantService.delete(id);
    }

    @Operation(summary = "租户注册")
    @PostMapping("/tenant/register")
    public R<PageResult<TenantVO>> register(@RequestBody @Valid TenantRegisterForm registerForm) {
        tenantService.register(registerForm);
        return R.ok();
    }
}
