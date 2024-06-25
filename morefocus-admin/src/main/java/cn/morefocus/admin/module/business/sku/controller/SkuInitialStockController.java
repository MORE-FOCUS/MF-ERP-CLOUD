package cn.morefocus.admin.module.business.sku.controller;

import cn.morefocus.admin.constants.AdminSwaggerTagConst;
import cn.morefocus.admin.module.business.sku.domain.form.SkuInitialStockQueryForm;
import cn.morefocus.admin.module.business.sku.domain.vo.SkuInitialStockVO;
import cn.morefocus.admin.module.business.sku.service.SkuInitialStockService;
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
 * 商品初始库存 Controller
 *
 * @author loki
 * @date 2024-06-23 11:57:41
 */
@Tag(name = AdminSwaggerTagConst.Business.SPU_INIT_STOCK)
@RestController
public class SkuInitialStockController {

    @Resource
    private SkuInitialStockService skuInitialStockService;

    /**
     * 分页查询
     */
    @Operation(summary = "查询分页列表")
    @PostMapping("/sku/initial/stock/queryPage")
    public R<PageResult<SkuInitialStockVO>> queryPage(@RequestBody @Valid SkuInitialStockQueryForm queryForm) {
        return R.ok(skuInitialStockService.queryPage(queryForm));
    }

    /**
     * 查询所有
     */
    @PostMapping("/sku/initial/stock/queryAll")
    public R<List<SkuInitialStockVO>> queryAll() {
        return R.ok(skuInitialStockService.queryAll());
    }
}
