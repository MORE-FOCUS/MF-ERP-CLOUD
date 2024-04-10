package cn.morefocus.admin.module.tenantindustry.controller;

import cn.morefocus.admin.module.tenantindustry.domain.form.TenantIndustryAddForm;
import cn.morefocus.admin.module.tenantindustry.domain.form.TenantIndustryQueryForm;
import cn.morefocus.admin.module.tenantindustry.domain.form.TenantIndustryUpdateForm;
import cn.morefocus.admin.module.tenantindustry.domain.vo.TenantIndustryVO;
import cn.morefocus.admin.module.tenantindustry.service.TenantIndustryService;
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
@Tag(name = "")
public class TenantIndustryController {

    @Resource
    private TenantIndustryService tenantIndustryService;

    @Operation(summary = "分页查询 @author loki")
    @PostMapping("/tenantIndustry/queryPage")
    public R<PageResult<TenantIndustryVO>> queryPage(@RequestBody @Valid TenantIndustryQueryForm queryForm) {
        return R.ok(tenantIndustryService.queryPage(queryForm));
    }

    @Operation(summary = "添加 @author loki")
    @PostMapping("/tenantIndustry/add")
    public R<String> add(@RequestBody @Valid TenantIndustryAddForm addForm) {
        return tenantIndustryService.add(addForm);
    }

    @Operation(summary = "更新 @author loki")
    @PostMapping("/tenantIndustry/update")
    public R<String> update(@RequestBody @Valid TenantIndustryUpdateForm updateForm) {
        return tenantIndustryService.update(updateForm);
    }

    @Operation(summary = "批量删除 @author loki")
    @PostMapping("/tenantIndustry/batchDelete")
    public R<String> batchDelete(@RequestBody List<Long> idList) {
        return tenantIndustryService.batchDelete(idList);
    }

    @Operation(summary = "单个删除 @author loki")
    @GetMapping("/tenantIndustry/delete/{id}")
    public R<String> batchDelete(@PathVariable Long id) {
        return tenantIndustryService.delete(id);
    }
}
