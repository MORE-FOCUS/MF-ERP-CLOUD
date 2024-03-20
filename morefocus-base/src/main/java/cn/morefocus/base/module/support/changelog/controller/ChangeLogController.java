package cn.morefocus.base.module.support.changelog.controller;

import cn.morefocus.base.common.controller.SupportBaseController;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.constant.SwaggerTagConst;
import cn.morefocus.base.module.support.changelog.domain.form.ChangeLogQueryForm;
import cn.morefocus.base.module.support.changelog.domain.vo.ChangeLogVO;
import cn.morefocus.base.module.support.changelog.service.ChangeLogService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.validation.Valid;

/**
 * 系统更新日志 Controller
 *
 * @author loki
 */

@RestController
@Tag(name = SwaggerTagConst.Support.CHANGE_LOG)
public class ChangeLogController extends SupportBaseController {

    @Resource
    private ChangeLogService changeLogService;

    @Operation(summary = "分页查询 @author loki")
    @PostMapping("/changeLog/queryPage")
    public R<PageResult<ChangeLogVO>> queryPage(@RequestBody @Valid ChangeLogQueryForm queryForm) {
        return R.ok(changeLogService.queryPage(queryForm));
    }
}