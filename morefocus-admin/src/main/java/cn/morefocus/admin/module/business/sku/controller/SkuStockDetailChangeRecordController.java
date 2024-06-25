package cn.morefocus.admin.module.business.sku.controller;

import cn.morefocus.admin.constants.AdminSwaggerTagConst;
import cn.morefocus.admin.module.business.sku.domain.form.SkuStockDetailChangeRecordQueryForm;
import cn.morefocus.admin.module.business.sku.domain.vo.SkuStockDetailChangeRecordVO;
import cn.morefocus.admin.module.business.sku.service.SkuStockDetailChangeRecordService;
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
 * 库存明细变化日志 Controller
 *
 * @author loki
 * @date 2024-04-01 00:20:24
 */
@Tag(name = AdminSwaggerTagConst.Business.SPU_STOCK)
@RestController
public class SkuStockDetailChangeRecordController {

    @Resource
    private SkuStockDetailChangeRecordService skuStockDetailChangeRecordService;

    /**
     * 分页查询
     */
    @Operation(summary = "查询分页列表")
    @PostMapping("/sku/stock/detail/change/record/queryPage")
    public R<PageResult<SkuStockDetailChangeRecordVO>> queryPage(@RequestBody @Valid SkuStockDetailChangeRecordQueryForm queryForm) {
        return R.ok(skuStockDetailChangeRecordService.queryPage(queryForm));
    }

    /**
     * 查询所有
     */
    @PostMapping("/sku/stock/detail/change/record/queryAll")
    public R<List<SkuStockDetailChangeRecordVO>> queryAll() {
        return R.ok(skuStockDetailChangeRecordService.queryAll());
    }
}
