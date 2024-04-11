package cn.morefocus.admin.module.system.support;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.morefocus.base.common.controller.SupportBaseController;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.constant.SwaggerTagConst;
import cn.morefocus.base.module.support.reload.domain.ReloadForm;
import cn.morefocus.base.module.support.reload.domain.ReloadItemVO;
import cn.morefocus.base.module.support.reload.domain.ReloadResultVO;
import cn.morefocus.base.module.support.reload.service.ReloadService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

/**
 * reload (内存热加载、钩子等)
 */
@RestController
@Tag(name = SwaggerTagConst.Support.RELOAD)
public class AdminReloadController extends SupportBaseController {

    @Resource
    private ReloadService reloadService;

    @Operation(summary = "查询reload列表")
    @GetMapping("/reload/query")
    public R<List<ReloadItemVO>> query() {
        return reloadService.query();
    }

    @Operation(summary = "获取reload result")
    @GetMapping("/reload/result/{tag}")
    @SaCheckPermission("support:reload:result")
    public R<List<ReloadResultVO>> queryReloadResult(@PathVariable("tag") String tag) {
        return reloadService.queryReloadItemResult(tag);
    }

    @Operation(summary = "通过tag更新标识")
    @PostMapping("/reload/update")
    @SaCheckPermission("support:reload:update")
    public R<String> updateByTag(@RequestBody @Valid ReloadForm reloadForm) {
        return reloadService.updateByTag(reloadForm);
    }
}
