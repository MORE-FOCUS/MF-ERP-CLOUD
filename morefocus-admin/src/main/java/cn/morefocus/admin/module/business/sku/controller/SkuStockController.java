package cn.morefocus.admin.module.business.sku.controller;

import cn.morefocus.admin.constants.AdminSwaggerTagConst;
import cn.morefocus.admin.module.business.sku.domain.form.SkuStockQueryForm;
import cn.morefocus.admin.module.business.sku.domain.vo.SkuStockVO;
import cn.morefocus.admin.module.business.sku.service.SkuStockService;
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
 * 商品库存 Controller
 *
 * @author loki
 * @date 2024-06-23 11:57:19
 */
@Tag(name = AdminSwaggerTagConst.Business.SPU_STOCK)
@RestController
public class SkuStockController {

    @Resource
    private SkuStockService skuStockService;

    /**
     * 分页查询
     */
    @Operation(summary = "查询分页列表")
    @PostMapping("/skuStock/queryPage")
    public R<PageResult<SkuStockVO>> queryPage(@RequestBody @Valid SkuStockQueryForm queryForm) {
        return R.ok(skuStockService.queryPage(queryForm));
    }

    /**
     * 查询所有
     */
    @PostMapping("/skuStock/queryAll")
    public R<List<SkuStockVO>> queryAll() {
        return R.ok(skuStockService.queryAll());
    }
}
