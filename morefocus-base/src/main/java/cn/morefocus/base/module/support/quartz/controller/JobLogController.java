package cn.morefocus.base.module.support.quartz.controller;

import cn.morefocus.base.constant.SwaggerTagConst;
import cn.morefocus.base.module.support.quartz.service.JobLogService;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * 调度日志操作处理
 */
@RestController
@Tag(name = SwaggerTagConst.Support.QUARTZ)
public class JobLogController {
    @Resource
    private JobLogService jobLogService;
}
