package cn.morefocus.base.module.support.codegenerator.controller;

import cn.morefocus.base.common.controller.SupportBaseController;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.util.LocalResponseUtil;
import cn.morefocus.base.constant.SwaggerTagConst;
import cn.morefocus.base.module.support.codegenerator.domain.form.CodeGeneratorConfigForm;
import cn.morefocus.base.module.support.codegenerator.domain.form.CodeGeneratorPreviewForm;
import cn.morefocus.base.module.support.codegenerator.domain.form.TableQueryForm;
import cn.morefocus.base.module.support.codegenerator.domain.vo.TableColumnVO;
import cn.morefocus.base.module.support.codegenerator.domain.vo.TableConfigVO;
import cn.morefocus.base.module.support.codegenerator.domain.vo.TableVO;
import cn.morefocus.base.module.support.codegenerator.service.CodeGeneratorService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;
import java.util.List;

/**
 * 代码生成
 *
 * @author loki
 */
@Tag(name = SwaggerTagConst.Support.CODE_GENERATOR)
@Controller
public class CodeGeneratorController extends SupportBaseController {

    @Resource
    private CodeGeneratorService codeGeneratorService;

    // ------------------- 查询 -------------------

    @Operation(summary = "获取表的列 @author loki")
    @GetMapping("/codeGenerator/table/getTableColumns/{table}")
    @ResponseBody
    public R<List<TableColumnVO>> getTableColumns(@PathVariable String table) {
        return R.ok(codeGeneratorService.getTableColumns(table));
    }

    @Operation(summary = "查询数据库的表 @author loki")
    @PostMapping("/codeGenerator/table/queryTableList")
    @ResponseBody
    public R<PageResult<TableVO>> queryTableList(@RequestBody @Valid TableQueryForm tableQueryForm) {
        return R.ok(codeGeneratorService.queryTableList(tableQueryForm));
    }

    // ------------------- 配置 -------------------

    @Operation(summary = "获取表的配置信息 @author loki")
    @GetMapping("/codeGenerator/table/getConfig/{table}")
    @ResponseBody
    public R<TableConfigVO> getTableConfig(@PathVariable String table) {
        return R.ok(codeGeneratorService.getTableConfig(table));
    }

    @Operation(summary = "更新配置信息 @author loki")
    @PostMapping("/codeGenerator/table/updateConfig")
    @ResponseBody
    public R<String> updateConfig(@RequestBody @Valid CodeGeneratorConfigForm form) {
        return codeGeneratorService.updateConfig(form);
    }

    // ------------------- 生成 -------------------

    @Operation(summary = "代码预览 @author loki")
    @PostMapping("/codeGenerator/code/preview")
    @ResponseBody
    public R<String> preview(@RequestBody @Valid CodeGeneratorPreviewForm form) {
        return codeGeneratorService.preview(form);
    }

    @Operation(summary = "代码下载 @author loki")
    @GetMapping(value = "/codeGenerator/code/download/{tableName}", produces = "application/octet-stream")
    public void download(@PathVariable String tableName, HttpServletResponse response) throws IOException {

        R<byte[]> download = codeGeneratorService.download(tableName);

        if (download.getOk()) {
            LocalResponseUtil.setDownloadFileHeader(response, tableName + "_code.zip", (long) download.getData().length);
            response.getOutputStream().write(download.getData());
        } else {
            LocalResponseUtil.write(response, download);
        }
    }

}