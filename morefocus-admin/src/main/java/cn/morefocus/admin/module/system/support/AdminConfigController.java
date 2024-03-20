package cn.morefocus.admin.module.system.support;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.morefocus.base.common.controller.SupportBaseController;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.constant.SwaggerTagConst;
import cn.morefocus.base.module.support.config.service.ConfigService;
import cn.morefocus.base.module.support.config.domain.ConfigAddForm;
import cn.morefocus.base.module.support.config.domain.ConfigQueryForm;
import cn.morefocus.base.module.support.config.domain.ConfigUpdateForm;
import cn.morefocus.base.module.support.config.domain.ConfigVO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.validation.Valid;

/**
 * 配置
 *
 * @author loki
 */
@Tag(name = SwaggerTagConst.Support.CONFIG)
@RestController
public class AdminConfigController extends SupportBaseController {

    @Resource
    private ConfigService configService;

    @Operation(summary = "分页查询系统配置 @author loki")
    @PostMapping("/config/query")
    @SaCheckPermission("support:config:query")
    public R<PageResult<ConfigVO>> queryConfigPage(@RequestBody @Valid ConfigQueryForm queryForm) {
        return configService.queryConfigPage(queryForm);
    }

    @Operation(summary = "添加配置参数 @author loki")
    @PostMapping("/config/add")
    @SaCheckPermission("support:config:add")
    public R<String> addConfig(@RequestBody @Valid ConfigAddForm configAddForm) {
        return configService.add(configAddForm);
    }

    @Operation(summary = "修改配置参数 @author loki")
    @PostMapping("/config/update")
    @SaCheckPermission("support:config:update")
    public R<String> updateConfig(@RequestBody @Valid ConfigUpdateForm updateForm) {
        return configService.updateConfig(updateForm);
    }

}
