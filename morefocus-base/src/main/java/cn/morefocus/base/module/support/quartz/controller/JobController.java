package cn.morefocus.base.module.support.quartz.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.domain.ValidateList;
import cn.morefocus.base.constant.SwaggerTagConst;
import cn.morefocus.base.module.support.quartz.domain.form.JobAddForm;
import cn.morefocus.base.module.support.quartz.domain.form.JobQueryForm;
import cn.morefocus.base.module.support.quartz.domain.form.JobUpdateForm;
import cn.morefocus.base.module.support.quartz.domain.vo.JobVO;
import cn.morefocus.base.module.support.quartz.service.JobService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.quartz.SchedulerException;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;

/**
 * 调度任务信息操作处理
 */
@RestController
@Tag(name = SwaggerTagConst.Support.QUARTZ)
public class JobController {
    @Resource
    private JobService jobService;

    @Operation(summary = "分页查询")
    @PostMapping("/job/queryPage")
    @SaCheckPermission("quartz:job:query")
    public R<PageResult<JobVO>> queryPage(@RequestBody JobQueryForm queryForm) {
        return R.ok(jobService.queryPage(queryForm));
    }

    @Operation(summary = "添加")
    @PostMapping("/job/add")
    @SaCheckPermission("quartz:job:add")
    public R<String> add(@RequestBody @Valid JobAddForm addForm) {
        jobService.add(addForm);
        return R.ok();
    }

    @Operation(summary = "更新")
    @PostMapping("/job/update")
    @SaCheckPermission("quartz:job:update")
    public R<String> update(@RequestBody @Valid JobUpdateForm updateForm) {
        jobService.update(updateForm);
        return R.ok();
    }

    @Operation(summary = "批量删除")
    @PostMapping("/job/batchDelete")
    @SaCheckPermission("quartz:job:delete")
    public R<String> batchDelete(@RequestBody ValidateList<Long> idList) {
        jobService.batchDelete(idList);
        return R.ok();
    }

    @Operation(summary = "单个删除")
    @GetMapping("/job/delete/{jobId}")
    @SaCheckPermission("quartz:job:delete")
    public R<String> batchDelete(@PathVariable Long jobId) {
        jobService.delete(jobId);
        return R.ok();
    }

    @Operation(summary = "执行一次")
    @PostMapping("/job/run")
    @SaCheckPermission("quartz:job:run")
    public R<String> run(@RequestBody ValidateList<Long> idList) {
        try {
            jobService.run(idList);
        } catch (SchedulerException e) {
            throw new RuntimeException(e);
        }
        return R.ok();
    }

    @Operation(summary = "暂停")
    @PostMapping("/job/pause/{jobId}")
    @SaCheckPermission("quartz:job:pause")
    public R<String> pause(@PathVariable Long jobId) {
        return R.ok();
    }

    @Operation(summary = "启用")
    @PostMapping("/job/resume/{jobId}")
    @SaCheckPermission("quartz:job:start")
    public R<String> resume(@PathVariable Long jobId) {
        return R.ok();
    }
}
