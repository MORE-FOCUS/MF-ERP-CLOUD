package cn.morefocus.admin.module.business.goods.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.morefocus.admin.constant.AdminSwaggerTagConst;
import cn.morefocus.admin.module.business.goods.domain.form.GoodsAddForm;
import cn.morefocus.admin.module.business.goods.domain.form.GoodsQueryForm;
import cn.morefocus.admin.module.business.goods.domain.form.GoodsUpdateForm;
import cn.morefocus.admin.module.business.goods.domain.vo.GoodsExcelVO;
import cn.morefocus.admin.module.business.goods.domain.vo.GoodsVO;
import cn.morefocus.admin.module.business.goods.service.GoodsService;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.domain.ValidateList;
import cn.morefocus.base.common.util.LocalResponseUtil;
import com.alibaba.excel.EasyExcel;
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
 *
 * @author loki
 */
@RestController
@Tag(name = AdminSwaggerTagConst.Business.MANAGER_GOODS)
public class GoodsController {

    @Resource
    private GoodsService goodsService;

    @Operation(summary = "分页查询 @author loki")
    @PostMapping("/goods/query")
    @SaCheckPermission("goods:query")
    public R<PageResult<GoodsVO>> query(@RequestBody @Valid GoodsQueryForm queryForm) {
        return goodsService.query(queryForm);
    }

    @Operation(summary = "添加商品 @author loki")
    @PostMapping("/goods/add")
    @SaCheckPermission("goods:add")
    public R<String> add(@RequestBody @Valid GoodsAddForm addForm) {
        return goodsService.add(addForm);
    }

    @Operation(summary = "更新商品 @author loki")
    @PostMapping("/goods/update")
    @SaCheckPermission("goods:update")
    public R<String> update(@RequestBody @Valid GoodsUpdateForm updateForm) {
        return goodsService.update(updateForm);
    }

    @Operation(summary = "删除 @author loki")
    @GetMapping("/goods/delete/{goodsId}")
    @SaCheckPermission("goods:delete")
    public R<String> delete(@PathVariable Long goodsId) {
        return goodsService.delete(goodsId);
    }

    @Operation(summary = "批量 @author loki")
    @PostMapping("/goods/batchDelete")
    @SaCheckPermission("goods:batchDelete")
    public R<String> batchDelete(@RequestBody @Valid ValidateList<Long> idList) {
        return goodsService.batchDelete(idList);
    }

    // --------------- 导出和导入 -------------------

    @Operation(summary = "导入 @author loki")
    @PostMapping("/goods/importGoods")
    @SaCheckPermission("goods:importGoods")
    public R<String> importGoods(@RequestParam MultipartFile file) {
        return goodsService.importGoods(file);
    }

    @Operation(summary = "导出 @author loki")
    @GetMapping("/goods/exportGoods")
    @SaCheckPermission("goods:exportGoods")
    public void exportGoods(HttpServletResponse response) throws IOException {

        List<GoodsExcelVO> goodsList = goodsService.getAllGoods();

        // 设置下载消息头
        LocalResponseUtil.setDownloadFileHeader(response, "商品列表.xls", null);

        // 下载
        EasyExcel.write(response.getOutputStream(), GoodsExcelVO.class)
                .autoCloseStream(Boolean.FALSE)
                .sheet("商品")
                .doWrite(goodsList);
    }

}
