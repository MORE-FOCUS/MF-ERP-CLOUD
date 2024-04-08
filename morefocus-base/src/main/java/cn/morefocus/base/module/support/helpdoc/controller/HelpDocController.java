package cn.morefocus.base.module.support.helpdoc.controller;

import cn.morefocus.base.common.controller.SupportBaseController;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.util.LocalRequestUtil;
import cn.morefocus.base.constant.SwaggerTagConst;
import cn.morefocus.base.module.support.helpdoc.domain.form.HelpDocViewRecordQueryForm;
import cn.morefocus.base.module.support.helpdoc.domain.vo.HelpDocCatalogVO;
import cn.morefocus.base.module.support.helpdoc.domain.vo.HelpDocDetailVO;
import cn.morefocus.base.module.support.helpdoc.domain.vo.HelpDocVO;
import cn.morefocus.base.module.support.helpdoc.domain.vo.HelpDocViewRecordVO;
import cn.morefocus.base.module.support.helpdoc.service.HelpDocCatalogService;
import cn.morefocus.base.module.support.helpdoc.service.HelpDocUserService;
import cn.morefocus.base.module.support.repeatsubmit.annoation.RepeatSubmit;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

/**
 * 帮助文档
 *
 *
 */
@Tag(name = SwaggerTagConst.Support.HELP_DOC)
@RestController
public class HelpDocController extends SupportBaseController {

    @Resource
    private HelpDocCatalogService helpDocCatalogService;

    @Resource
    private HelpDocUserService helpDocUserService;

    // --------------------- 帮助文档 【目录】 -------------------------

    @Operation(summary = "帮助文档目录-获取全部 ")
    @GetMapping("/helpDoc/helpDocCatalog/getAll")
    public R<List<HelpDocCatalogVO>> getAll() {
        return R.ok(helpDocCatalogService.getAll());
    }

    // --------------------- 帮助文档 【用户】-------------------------

    @Operation(summary = "【用户】帮助文档-查看详情 ")
    @GetMapping("/helpDoc/user/view/{helpDocId}")
    @RepeatSubmit
    public R<HelpDocDetailVO> view(@PathVariable Long helpDocId, HttpServletRequest request) {
        return helpDocUserService.view(
                LocalRequestUtil.getRequestUser(),
                helpDocId);
    }

    @Operation(summary = "【用户】帮助文档-查询全部 ")
    @GetMapping("/helpDoc/user/queryAllHelpDocList")
    @RepeatSubmit
    public R<List<HelpDocVO>> queryAllHelpDocList() {
        return helpDocUserService.queryAllHelpDocList();
    }

    @Operation(summary = "【用户】帮助文档-查询 查看记录 ")
    @PostMapping("/helpDoc/user/queryViewRecord")
    @RepeatSubmit
    public R<PageResult<HelpDocViewRecordVO>> queryViewRecord(@RequestBody @Valid HelpDocViewRecordQueryForm helpDocViewRecordQueryForm) {
        return R.ok(helpDocUserService.queryViewRecord(helpDocViewRecordQueryForm));
    }
}