package cn.morefocus.admin.module.business.oa.notice.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.hutool.extra.servlet.ServletUtil;
import cn.morefocus.admin.constant.AdminSwaggerTagConst;
import cn.morefocus.admin.module.business.oa.notice.domain.form.*;
import cn.morefocus.admin.module.business.oa.notice.domain.vo.*;
import cn.morefocus.admin.module.business.oa.notice.service.NoticeEmployeeService;
import cn.morefocus.admin.module.business.oa.notice.service.NoticeService;
import cn.morefocus.admin.module.business.oa.notice.service.NoticeTypeService;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.util.RequestContext;
import cn.morefocus.base.module.support.operatelog.annotation.OperateLog;
import cn.morefocus.base.module.support.repeatsubmit.annoation.RepeatSubmit;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

/**
 * 公告、通知、新闻等等
 */
@Tag(name = AdminSwaggerTagConst.Business.OA_NOTICE)
@RestController
@OperateLog
public class NoticeController {

    @Resource
    private NoticeService noticeService;

    @Resource
    private NoticeTypeService noticeTypeService;

    @Resource
    private NoticeEmployeeService noticeEmployeeService;

    // --------------------- 通知公告类型 -------------------------

    @Operation(summary = "通知公告类型-获取全部")
    @GetMapping("/oa/noticeType/getAll")
    public R<List<NoticeTypeVO>> getAll() {
        return R.ok(noticeTypeService.getAll());
    }

    @Operation(summary = "通知公告类型-添加")
    @GetMapping("/oa/noticeType/add/{name}")
    public R<String> add(@PathVariable String name) {
        return noticeTypeService.add(name);
    }

    @Operation(summary = "通知公告类型-修改")
    @GetMapping("/oa/noticeType/update/{noticeTypeId}/{name}")
    public R<String> update(@PathVariable Long noticeTypeId, @PathVariable String name) {
        return noticeTypeService.update(noticeTypeId, name);
    }

    @Operation(summary = "通知公告类型-删除")
    @GetMapping("/oa/noticeType/delete/{noticeTypeId}")
    public R<String> deleteNoticeType(@PathVariable Long noticeTypeId) {
        return noticeTypeService.delete(noticeTypeId);
    }

    // --------------------- 【管理】通知公告-------------------------

    @Operation(summary = "【管理】通知公告-分页查询 ")
    @PostMapping("/oa/notice/query")
    @SaCheckPermission("oa:notice:query")
    public R<PageResult<NoticeVO>> query(@RequestBody @Valid NoticeQueryForm queryForm) {
        return R.ok(noticeService.query(queryForm));
    }

    @Operation(summary = "【管理】通知公告-添加 ")
    @PostMapping("/oa/notice/add")
    @RepeatSubmit
    @SaCheckPermission("oa:notice:add")
    public R<String> add(@RequestBody @Valid NoticeAddForm addForm) {
        addForm.setCreateUserId(RequestContext.getUserId());
        return noticeService.add(addForm);
    }

    @Operation(summary = "【管理】通知公告-更新 ")
    @PostMapping("/oa/notice/update")
    @RepeatSubmit
    @SaCheckPermission("oa:notice:update")
    public R<String> update(@RequestBody @Valid NoticeUpdateForm updateForm) {
        return noticeService.update(updateForm);
    }

    @Operation(summary = "【管理】通知公告-更新详情 ")
    @GetMapping("/oa/notice/getUpdateVO/{noticeId}")
    @SaCheckPermission("oa:notice:update")
    public R<NoticeUpdateFormVO> getUpdateFormVO(@PathVariable Long noticeId) {
        return R.ok(noticeService.getUpdateFormVO(noticeId));
    }

    @Operation(summary = "【管理】通知公告-删除 ")
    @GetMapping("/oa/notice/delete/{noticeId}")
    @SaCheckPermission("oa:notice:delete")
    public R<String> delete(@PathVariable Long noticeId) {
        return noticeService.delete(noticeId);
    }

    // --------------------- 【员工】查看 通知公告 -------------------------

    @Operation(summary = "【员工】通知公告-查看详情 ")
    @GetMapping("/oa/notice/employee/view/{noticeId}")
    public R<NoticeDetailVO> view(@PathVariable Long noticeId, HttpServletRequest request) {
        return noticeEmployeeService.view(
                RequestContext.getUserId(),
                noticeId,
                ServletUtil.getClientIP(request),
                request.getHeader("User-Agent")
        );
    }

    @Operation(summary = "【员工】通知公告-查询全部 ")
    @PostMapping("/oa/notice/employee/query")
    public R<PageResult<NoticeEmployeeVO>> queryEmployeeNotice(@RequestBody @Valid NoticeEmployeeQueryForm noticeEmployeeQueryForm) {
        return noticeEmployeeService.queryList(RequestContext.getUserId(), noticeEmployeeQueryForm);
    }

    @Operation(summary = "【员工】通知公告-查询 查看记录 ")
    @PostMapping("/oa/notice/employee/queryViewRecord")
    public R<PageResult<NoticeViewRecordVO>> queryViewRecord(@RequestBody @Valid NoticeViewRecordQueryForm noticeViewRecordQueryForm) {
        return R.ok(noticeEmployeeService.queryViewRecord(noticeViewRecordQueryForm));
    }
}