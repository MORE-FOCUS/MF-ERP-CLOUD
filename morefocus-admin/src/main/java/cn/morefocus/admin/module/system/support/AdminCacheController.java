package cn.morefocus.admin.module.system.support;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.morefocus.base.common.controller.SupportBaseController;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.constant.SwaggerTagConst;
import cn.morefocus.base.module.support.cache.service.CacheService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * 缓存
 */
@RestController
@Tag(name = SwaggerTagConst.Support.CACHE)
public class AdminCacheController extends SupportBaseController {

    @Resource
    private CacheService cacheService;

    @Operation(summary = "获取所有缓存")
    @GetMapping("/cache/names")
    @SaCheckPermission("support:cache:keys")
    public R<List<String>> cacheNames() {
        return R.ok(cacheService.cacheNames());
    }

    @Operation(summary = "移除某个缓存")
    @GetMapping("/cache/remove/{cacheName}")
    @SaCheckPermission("support:cache:delete")
    public R<String> removeCache(@PathVariable String cacheName) {
        cacheService.removeCache(cacheName);
        return R.ok();
    }

    @Operation(summary = "获取某个缓存的所有key")
    @GetMapping("/cache/keys/{cacheName}")
    @SaCheckPermission("support:cache:keys")
    public R<List<String>> cacheKeys(@PathVariable String cacheName) {
        return R.ok(cacheService.cacheKey(cacheName));
    }

}
