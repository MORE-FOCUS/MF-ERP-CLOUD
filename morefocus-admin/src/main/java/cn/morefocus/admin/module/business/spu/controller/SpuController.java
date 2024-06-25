package cn.morefocus.admin.module.business.spu.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.morefocus.admin.constants.AdminSwaggerTagConst;
import cn.morefocus.admin.module.business.sku.domain.form.SkuBarcodeUpdateForm;
import cn.morefocus.admin.module.business.sku.domain.form.SkuInitialStockUpdateForm;
import cn.morefocus.admin.module.business.sku.domain.form.SkuPriceUpdateForm;
import cn.morefocus.admin.module.business.sku.domain.form.SkuWarnConfigUpdateForm;
import cn.morefocus.admin.module.business.spu.domain.form.*;
import cn.morefocus.admin.module.business.spu.domain.vo.SpuExportVO;
import cn.morefocus.admin.module.business.spu.domain.vo.SpuVO;
import cn.morefocus.admin.module.business.spu.service.SpuService;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.domain.ValidateList;
import cn.morefocus.base.common.util.ExcelUtil;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;
import java.util.List;

/**
 * 商品业务
 */
@RestController
@Tag(name = AdminSwaggerTagConst.Business.MANAGER_SPU)
public class SpuController {

    @Resource
    private SpuService spuService;

    @Operation(summary = "分页查询")
    @PostMapping("/spu/queryPage")
    @SaCheckPermission("business:spu:query")
    public R<PageResult<SpuVO>> query(@RequestBody @Valid SpuPageQueryForm queryForm) {
        return spuService.query(queryForm);
    }

    @Operation(summary = "查询商品详情")
    @GetMapping("/spu/queryDetail/{id}")
    @SaCheckPermission("business:spu:detail")
    public R<SpuVO> queryDetail(@PathVariable("id") Long id) {
        return spuService.queryDetail(id);
    }

    @Operation(summary = "添加商品基本信息")
    @PostMapping("/spu/base/add")
    @SaCheckPermission("business:spu:add")
    public R<String> addSpuBase(@RequestBody @Valid SpuBaseAddForm addForm) {
        return spuService.addSpuBase(addForm);
    }

    @Operation(summary = "更新商品基本信息")
    @PostMapping("/spu/base/update")
    @SaCheckPermission("business:spu:update")
    public R<String> updateSpuBase(@RequestBody @Valid SpuBaseUpdateForm updateForm) {
        return spuService.updateSpuBase(updateForm);
    }

    @Operation(summary = "更新商品单位")
    @PostMapping("/spu/unit/update")
    @SaCheckPermission("business:spu:update")
    public R<String> updateSpuUnit(@RequestBody @Valid SpuUnitUpdateForm updateForm) {
        return spuService.updateSpuUnit(updateForm);
    }

    @Operation(summary = "更新商品图片")
    @PostMapping("/spu/images/update")
    @SaCheckPermission("business:spu:update")
    public R<String> updateSpuImages(@RequestBody @Valid SpuImagesUpdateForm updateForm) {
        return spuService.updateSpuImages(updateForm);
    }

    @Operation(summary = "更新商品属性")
    @PostMapping("/spu/special/update")
    @SaCheckPermission("business:spu:update")
    public R<String> updateSpuSpecial(@RequestBody @Valid SpuSpecialUpdateForm updateForm) {
        return spuService.updateSpuSpecial(updateForm);
    }

    @Operation(summary = "更新商品条码")
    @PostMapping("/spu/barcode/update")
    @SaCheckPermission("business:spu:update")
    public R<String> updateSpuBarcode(@RequestBody @Valid SkuBarcodeUpdateForm updateForm) {
        return spuService.updateSpuBarcode(updateForm);
    }

    @Operation(summary = "更新商品单价")
    @PostMapping("/spu/price/update")
    @SaCheckPermission("business:spu:update")
    public R<String> updateSpuPrice(@RequestBody @Valid SkuPriceUpdateForm updateForm) {
        return spuService.updateSpuPrice(updateForm);
    }

    @Operation(summary = "更新商品初始库存")
    @PostMapping("/spu/initial-stock/update")
    @SaCheckPermission("business:spu:update")
    public R<String> updateSpuInitialStock(@RequestBody @Valid SkuInitialStockUpdateForm updateForm) {
        return spuService.updateSpuInitialStock(updateForm);
    }

    @Operation(summary = "更新商品库存预警")
    @PostMapping("/spu/stock-warn-config/update")
    @SaCheckPermission("business:spu:update")
    public R<String> updateSpuWarnConfig(@RequestBody @Valid SkuWarnConfigUpdateForm updateForm) {
        return spuService.updateSpuWarnConfig(updateForm);
    }

    @Operation(summary = "删除")
    @GetMapping("/spu/delete/{spuId}")
    @SaCheckPermission("business:spu:delete")
    public R<String> delete(@PathVariable Long spuId) {
        return spuService.delete(spuId);
    }

    @Operation(summary = "批量")
    @PostMapping("/spu/batchDelete")
    @SaCheckPermission("business:spu:batchDelete")
    public R<String> batchDelete(@RequestBody @Valid ValidateList<Long> idList) {
        return spuService.batchDelete(idList);
    }

    // --------------- 导出和导入 -------------------

    @Operation(summary = "导入")
    @PostMapping("/spu/importSpu")
    @SaCheckPermission("business:spu:importSpu")
    public R<String> importGoods(@RequestParam MultipartFile file) {
        return spuService.importGoods(file);
    }

    @Operation(summary = "导出")
    @GetMapping("/spu/exportSpu")
    @SaCheckPermission("business:spu:exportSpu")
    public void exportGoods(HttpServletResponse response) throws IOException {
        List<SpuExportVO> spuList = spuService.getAllGoods();
        ExcelUtil.exportExcel(response, "商品列表.xlsx", "商品", SpuExportVO.class, spuList);
    }

}
