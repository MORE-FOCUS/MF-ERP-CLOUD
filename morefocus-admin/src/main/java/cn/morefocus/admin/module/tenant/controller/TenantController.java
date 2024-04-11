package cn.morefocus.admin.module.tenant.controller;

import cn.morefocus.admin.module.tenant.domain.form.TenantAddForm;
import cn.morefocus.admin.module.tenant.domain.form.TenantQueryForm;
import cn.morefocus.admin.module.tenant.domain.form.TenantUpdateForm;
import cn.morefocus.admin.module.tenant.domain.vo.TenantVO;
import cn.morefocus.admin.module.tenant.service.TenantService;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
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
public class TenantController {

    @Resource
    private TenantService TenantService;

    @PostMapping("/tenant/queryPage")
    public R<PageResult<TenantVO>> queryPage(@RequestBody @Valid TenantQueryForm queryForm) {
        return R.ok(TenantService.queryPage(queryForm));
    }

    @PostMapping("/tenant/add")
    public R<String> add(@RequestBody @Valid TenantAddForm addForm) {
        return TenantService.add(addForm);
    }

    @PostMapping("/tenant/update")
    public R<String> update(@RequestBody @Valid TenantUpdateForm updateForm) {
        return TenantService.update(updateForm);
    }

    @PostMapping("/tenant/batchDelete")
    public R<String> batchDelete(@RequestBody @Validated List<Long> idList) {
        return TenantService.batchDelete(idList);
    }

    @GetMapping("/tenant/delete/{id}")
    public R<String> batchDelete(@PathVariable Long id) {
        return TenantService.delete(id);
    }
}
