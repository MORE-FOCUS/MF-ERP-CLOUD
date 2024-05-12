package cn.morefocus.admin.module.business.spu.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.morefocus.admin.constant.AdminSwaggerTagConst;
import cn.morefocus.admin.module.business.spu.domain.form.SpuAddForm;
import cn.morefocus.admin.module.business.spu.domain.form.SpuPageQueryForm;
import cn.morefocus.admin.module.business.spu.domain.form.SpuUpdateForm;
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

    @Operation(summary = "分页查询 ")
    @PostMapping("/spu/query")
    @SaCheckPermission("business:spu:query")
    public R<PageResult<SpuVO>> query(@RequestBody @Valid SpuPageQueryForm queryForm) {
        return spuService.query(queryForm);
    }

    @Operation(summary = "添加商品 ")
    @PostMapping("/spu/add")
    @SaCheckPermission("business:spu:add")
    public R<String> add(@RequestBody @Valid SpuAddForm addForm) {
        return spuService.add(addForm);
    }

    @Operation(summary = "更新商品 ")
    @PostMapping("/spu/update")
    @SaCheckPermission("business:spu:update")
    public R<String> update(@RequestBody @Valid SpuUpdateForm updateForm) {
        return spuService.update(updateForm);
    }

    @Operation(summary = "删除 ")
    @GetMapping("/spu/delete/{spuId}")
    @SaCheckPermission("business:spu:delete")
    public R<String> delete(@PathVariable Long spuId) {
        return spuService.delete(spuId);
    }

    @Operation(summary = "批量 ")
    @PostMapping("/spu/batchDelete")
    @SaCheckPermission("business:spu:batchDelete")
    public R<String> batchDelete(@RequestBody @Valid ValidateList<Long> idList) {
        return spuService.batchDelete(idList);
    }

    // --------------- 导出和导入 -------------------

    @Operation(summary = "导入 ")
    @PostMapping("/spu/importSpu")
    @SaCheckPermission("business:spu:importSpu")
    public R<String> importGoods(@RequestParam MultipartFile file) {
        return spuService.importGoods(file);
    }

    @Operation(summary = "导出 ")
    @GetMapping("/spu/exportSpu")
    @SaCheckPermission("business:spu:exportSpu")
    public void exportGoods(HttpServletResponse response) throws IOException {
        List<SpuExportVO> spuList = spuService.getAllGoods();
        ExcelUtil.exportExcel(response, "商品列表.xlsx", "商品", SpuExportVO.class, spuList);
    }

}
