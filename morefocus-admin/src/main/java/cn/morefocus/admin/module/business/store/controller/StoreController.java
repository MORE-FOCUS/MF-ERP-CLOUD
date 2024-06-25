package cn.morefocus.admin.module.business.store.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.morefocus.admin.constants.AdminSwaggerTagConst;
import cn.morefocus.admin.module.business.store.service.StoreService;
import cn.morefocus.admin.module.system.department.domain.form.DepartmentPageQueryForm;
import cn.morefocus.admin.module.system.department.domain.form.DepartmentQueryForm;
import cn.morefocus.admin.module.system.department.domain.vo.DepartmentVO;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * 门店 Controller
 *
 * @author loki
 * @date 2024-06-23 23:29:01
 */
@Tag(name = AdminSwaggerTagConst.Business.STORE)
@RestController
public class StoreController {

    @Resource
    private StoreService storeService;

    /**
     * 分页查询
     */
    @Operation(summary = "查询分页列表")
    @PostMapping("/store/queryPage")
    @SaCheckPermission("common:permission")
    public R<PageResult<DepartmentVO>> queryPage(@RequestBody DepartmentPageQueryForm queryForm) {
        return R.ok(storeService.queryPage(queryForm));
    }

    /**
     * 查询所有
     */
    @PostMapping("/store/queryAll")
    @SaCheckPermission("common:permission")
    public R<List<DepartmentVO>> queryAll(@RequestBody DepartmentQueryForm queryForm) {
        return R.ok(storeService.queryAll(queryForm));
    }
}
