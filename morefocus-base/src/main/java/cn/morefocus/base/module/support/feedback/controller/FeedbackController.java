package cn.morefocus.base.module.support.feedback.controller;

import cn.morefocus.base.common.controller.SupportBaseController;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.domain.RequestUser;
import cn.morefocus.base.common.util.SecurityContextHolder;
import cn.morefocus.base.constant.SwaggerTagConst;
import cn.morefocus.base.module.support.feedback.domain.FeedbackAddForm;
import cn.morefocus.base.module.support.feedback.domain.FeedbackQueryForm;
import cn.morefocus.base.module.support.feedback.domain.FeedbackVO;
import cn.morefocus.base.module.support.feedback.service.FeedbackService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.validation.Valid;

/**
 * 意见反馈
 */
@Slf4j
@Tag(name = SwaggerTagConst.Support.FEEDBACK)
@RestController
public class FeedbackController extends SupportBaseController {

    @Resource
    private FeedbackService feedbackService;

    @Operation(summary = "意见反馈-分页查询 ")
    @PostMapping("/feedback/query")
    public R<PageResult<FeedbackVO>> query(@RequestBody @Valid FeedbackQueryForm queryForm) {
        return feedbackService.query(queryForm);
    }

    @Operation(summary = "意见反馈-新增 ")
    @PostMapping("/feedback/add")
    public R<String> add(@RequestBody @Valid FeedbackAddForm addForm) {
        RequestUser employee = SecurityContextHolder.getRequestUser();
        return feedbackService.add(addForm, employee);
    }
}
