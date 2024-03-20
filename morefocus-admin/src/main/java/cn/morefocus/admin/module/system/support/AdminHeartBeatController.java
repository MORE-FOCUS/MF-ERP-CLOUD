package cn.morefocus.admin.module.system.support;

import cn.morefocus.base.common.controller.SupportBaseController;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.constant.SwaggerTagConst;
import cn.morefocus.base.module.support.heartbeat.service.HeartBeatService;
import cn.morefocus.base.module.support.heartbeat.domain.HeartBeatRecordQueryForm;
import cn.morefocus.base.module.support.heartbeat.domain.HeartBeatRecordVO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.validation.Valid;

/**
 * 心跳记录
 *
 * @author loki
 */
@Tag(name = SwaggerTagConst.Support.HEART_BEAT)
@RestController
public class AdminHeartBeatController extends SupportBaseController {

    @Resource
    private HeartBeatService heartBeatService;

    @PostMapping("/heartBeat/query")
    @Operation(summary = "查询心跳记录 @author loki")
    public R<PageResult<HeartBeatRecordVO>> query(@RequestBody @Valid HeartBeatRecordQueryForm pageParam) {
        return heartBeatService.pageQuery(pageParam);
    }

}
