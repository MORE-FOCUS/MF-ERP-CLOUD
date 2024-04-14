package cn.morefocus.admin.module.business.tenant.controller;

import cn.morefocus.admin.constant.AdminSwaggerTagConst;
import cn.morefocus.admin.module.business.tenant.domain.form.TenantIndustryAddForm;
import cn.morefocus.admin.module.business.tenant.domain.form.TenantIndustryQueryForm;
import cn.morefocus.admin.module.business.tenant.domain.form.TenantIndustryUpdateForm;
import cn.morefocus.admin.module.business.tenant.domain.vo.TenantIndustryVO;
import cn.morefocus.admin.module.business.tenant.service.TenantIndustryService;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

/**
 * 租户所属行业 Controller
 *
 * @author loki
 * @date 2024-04-09 00:06:08
 */
@RestController
@Tag(name = AdminSwaggerTagConst.Business.TENANT_INDUSTRY)
public class TenantIndustryController {

    @Resource
    private TenantIndustryService tenantIndustryService;

    @Operation(summary = "分页查询")
    @PostMapping("/tenant/industry/queryPage")
    public R<PageResult<TenantIndustryVO>> queryPage(@RequestBody @Valid TenantIndustryQueryForm queryForm) {
        return R.ok(tenantIndustryService.queryPage(queryForm));
    }

    @Operation(summary = "查询所有")
    @PostMapping("/tenant/industry/queryAll")
    public R<List<TenantIndustryVO>> queryAll() {
        return R.ok(tenantIndustryService.queryAll());
    }

    @Operation(summary = "添加")
    @PostMapping("/tenant/industry/add")
    public R<String> add(@RequestBody @Valid TenantIndustryAddForm addForm) {
        return tenantIndustryService.add(addForm);
    }

    @Operation(summary = "更新")
    @PostMapping("/tenant/industry/update")
    public R<String> update(@RequestBody @Valid TenantIndustryUpdateForm updateForm) {
        return tenantIndustryService.update(updateForm);
    }

    @Operation(summary = "批量删除")
    @PostMapping("/tenant/industry/batchDelete")
    public R<String> batchDelete(@RequestBody List<Long> idList) {
        return tenantIndustryService.batchDelete(idList);
    }

    @Operation(summary = "单个删除")
    @GetMapping("/tenant/industry/delete/{id}")
    public R<String> batchDelete(@PathVariable Long id) {
        return tenantIndustryService.delete(id);
    }
}
