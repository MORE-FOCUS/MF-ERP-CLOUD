package cn.morefocus.admin.module.system.support;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.morefocus.base.common.controller.SupportBaseController;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.domain.ValidateList;
import cn.morefocus.base.constant.SwaggerTagConst;
import cn.morefocus.base.module.support.changelog.domain.form.ChangeLogAddForm;
import cn.morefocus.base.module.support.changelog.domain.form.ChangeLogUpdateForm;
import cn.morefocus.base.module.support.changelog.service.ChangeLogService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;

/**
 * 系统更新日志 Controller
 */

@RestController
@Tag(name = SwaggerTagConst.Support.CHANGE_LOG)
public class AdminChangeLogController extends SupportBaseController {

    @Resource
    private ChangeLogService changeLogService;

    @Operation(summary = "添加 ")
    @PostMapping("/changeLog/add")
    @SaCheckPermission("support:changeLog:add")
    public R<String> add(@RequestBody @Valid ChangeLogAddForm addForm) {
        return changeLogService.add(addForm);
    }

    @Operation(summary = "更新 ")
    @PostMapping("/changeLog/update")
    @SaCheckPermission("support:changeLog:update")
    public R<String> update(@RequestBody @Valid ChangeLogUpdateForm updateForm) {
        return changeLogService.update(updateForm);
    }

    @Operation(summary = "批量删除 ")
    @PostMapping("/changeLog/batchDelete")
    @SaCheckPermission("support:changeLog:batchDelete")
    public R<String> batchDelete(@RequestBody ValidateList<Long> idList) {
        return changeLogService.batchDelete(idList);
    }

    @Operation(summary = "单个删除 ")
    @GetMapping("/changeLog/delete/{changeLogId}")
    @SaCheckPermission("support:changeLog:delete")
    public R<String> batchDelete(@PathVariable Long changeLogId) {
        return changeLogService.delete(changeLogId);
    }
}