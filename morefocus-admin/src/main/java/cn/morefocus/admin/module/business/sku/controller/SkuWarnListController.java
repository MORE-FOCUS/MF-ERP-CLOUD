package cn.morefocus.admin.module.business.sku.controller;

import cn.morefocus.admin.constants.AdminSwaggerTagConst;
import cn.morefocus.admin.module.business.sku.domain.form.SkuWarnConfigQueryForm;
import cn.morefocus.admin.module.business.sku.domain.vo.SkuWarnConfigVO;
import cn.morefocus.admin.module.business.sku.service.SkuWarnConfigService;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

/**
 * 商品库存预警 Controller
 *
 * @author loki
 * @date 2024-06-23 12:20:59
 */
@Tag(name = AdminSwaggerTagConst.Business.SPU_STOCK_WARN)
@RestController
public class SkuWarnListController {

    @Resource
    private SkuWarnConfigService skuWarnLisService;

    /**
     * 分页查询
     */
    @Operation(summary = "查询分页列表")
    @PostMapping("/sku/warn/list/queryPage")
    public R<PageResult<SkuWarnConfigVO>> queryPage(@RequestBody @Valid SkuWarnConfigQueryForm queryForm) {
        return R.ok(skuWarnLisService.queryPage(queryForm));
    }

    /**
     * 查询所有
     */
    @PostMapping("/sku/warn/list/queryAll")
    public R<List<SkuWarnConfigVO>> queryAll() {
        return R.ok(skuWarnLisService.queryAll());
    }
}
