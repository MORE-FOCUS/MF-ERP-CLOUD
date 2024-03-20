package cn.morefocus.base.module.support.config.controller;

import cn.morefocus.base.common.controller.SupportBaseController;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.constant.SwaggerTagConst;
import cn.morefocus.base.module.support.config.service.ConfigService;
import cn.morefocus.base.module.support.config.domain.ConfigVO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * 配置
 *
 * @author loki
 */
@Tag(name = SwaggerTagConst.Support.CONFIG)
@RestController
public class ConfigController extends SupportBaseController {

    @Resource
    private ConfigService configService;

    @Operation(summary = "查询配置详情 @author loki")
    @GetMapping("/config/queryByKey")
    public R<ConfigVO> queryByKey(@RequestParam String configKey) {
        return R.ok(configService.getConfig(configKey));
    }

}
