package cn.morefocus.admin.module.system.support;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.morefocus.base.common.controller.SupportBaseController;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.constant.SwaggerTagConst;
import cn.morefocus.base.module.support.helpdoc.domain.form.*;
import cn.morefocus.base.module.support.helpdoc.domain.vo.HelpDocDetailVO;
import cn.morefocus.base.module.support.helpdoc.domain.vo.HelpDocVO;
import cn.morefocus.base.module.support.helpdoc.service.HelpDocCatalogService;
import cn.morefocus.base.module.support.helpdoc.service.HelpDocService;
import cn.morefocus.base.module.support.repeatsubmit.annoation.RepeatSubmit;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

/**
 * 帮助文档
 *
 * @author loki
 */
@Tag(name = SwaggerTagConst.Support.HELP_DOC)
@RestController
public class AdminHelpDocController extends SupportBaseController {

    @Resource
    private HelpDocService helpDocService;

    @Resource
    private HelpDocCatalogService helpDocCatalogService;

    // --------------------- 帮助文档 【目录管理】 -------------------------


    @Operation(summary = "帮助文档目录-添加 @author loki")
    @PostMapping("/helpDoc/helpDocCatalog/add")
    public R<String> addHelpDocCatalog(@RequestBody @Valid HelpDocCatalogAddForm helpDocCatalogAddForm) {
        return helpDocCatalogService.add(helpDocCatalogAddForm);
    }

    @Operation(summary = "帮助文档目录-更新 @author loki")
    @PostMapping("/helpDoc/helpDocCatalog/update")
    public R<String> updateHelpDocCatalog(@RequestBody @Valid HelpDocCatalogUpdateForm helpDocCatalogUpdateForm) {
        return helpDocCatalogService.update(helpDocCatalogUpdateForm);
    }

    @Operation(summary = "帮助文档目录-删除 @author loki")
    @GetMapping("/helpDoc/helpDocCatalog/delete/{helpDocCatalogId}")
    public R<String> deleteHelpDocCatalog(@PathVariable Long helpDocCatalogId) {
        return helpDocCatalogService.delete(helpDocCatalogId);
    }

    // --------------------- 帮助文档 【管理:增、删、查、改】-------------------------

    @Operation(summary = "【管理】帮助文档-分页查询 @author loki")
    @PostMapping("/helpDoc/query")
    @SaCheckPermission("support:helpDoc:query")
    public R<PageResult<HelpDocVO>> query(@RequestBody @Valid HelpDocQueryForm queryForm) {
        return R.ok(helpDocService.query(queryForm));
    }

    @Operation(summary = "【管理】帮助文档-获取详情 @author loki")
    @GetMapping("/helpDoc/getDetail/{helpDocId}")
    @SaCheckPermission("support:helpDoc:add")
    public R<HelpDocDetailVO> getDetail(@PathVariable Long helpDocId) {
        return R.ok(helpDocService.getDetail(helpDocId));
    }

    @Operation(summary = "【管理】帮助文档-添加 @author loki")
    @PostMapping("/helpDoc/add")
    @RepeatSubmit
    public R<String> add(@RequestBody @Valid HelpDocAddForm addForm) {
        return helpDocService.add(addForm);
    }

    @Operation(summary = "【管理】帮助文档-更新 @author loki")
    @PostMapping("/helpDoc/update")
    @RepeatSubmit
    public R<String> update(@RequestBody @Valid HelpDocUpdateForm updateForm) {
        return helpDocService.update(updateForm);
    }

    @Operation(summary = "【管理】帮助文档-删除 @author loki")
    @GetMapping("/helpDoc/delete/{helpDocId}")
    public R<String> delete(@PathVariable Long helpDocId) {
        return helpDocService.delete(helpDocId);
    }

    @Operation(summary = "【管理】帮助文档-根据关联id查询 @author loki")
    @GetMapping("/helpDoc/queryHelpDocByRelationId/{relationId}")
    public R<List<HelpDocVO>> queryHelpDocByRelationId(@PathVariable Long relationId) {
        return R.ok(helpDocService.queryHelpDocByRelationId(relationId));
    }

}