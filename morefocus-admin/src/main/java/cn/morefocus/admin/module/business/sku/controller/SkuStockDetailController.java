package cn.morefocus.admin.module.business.sku.controller;

import cn.morefocus.admin.constants.AdminSwaggerTagConst;
import cn.morefocus.admin.module.business.sku.domain.form.SkuStockDetailQueryForm;
import cn.morefocus.admin.module.business.sku.domain.vo.SkuStockDetailVO;
import cn.morefocus.admin.module.business.sku.service.SkuStockDetailService;
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
 * 商品库存明细 Controller
 *
 * @author loki
 * @date 2024-06-23 11:57:24
 */
@Tag(name = AdminSwaggerTagConst.Business.SPU_STOCK)
@RestController
public class SkuStockDetailController {

    @Resource
    private SkuStockDetailService skuStockDetailService;

    /**
     * 分页查询
     */
    @Operation(summary = "查询分页列表")
    @PostMapping("/sku/stock/detail/queryPage")
    public R<PageResult<SkuStockDetailVO>> queryPage(@RequestBody @Valid SkuStockDetailQueryForm queryForm) {
        return R.ok(skuStockDetailService.queryPage(queryForm));
    }

    /**
     * 查询所有
     */
    @PostMapping("/sku/stock/detail/queryAll")
    public R<List<SkuStockDetailVO>> queryAll() {
        return R.ok(skuStockDetailService.queryAll());
    }
}
