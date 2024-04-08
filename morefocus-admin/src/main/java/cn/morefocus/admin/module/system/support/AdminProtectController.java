package cn.morefocus.admin.module.system.support;

import cn.morefocus.base.common.controller.SupportBaseController;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.domain.ValidateList;
import cn.morefocus.base.constant.SwaggerTagConst;
import cn.morefocus.base.module.support.securityprotect.domain.LoginFailQueryForm;
import cn.morefocus.base.module.support.securityprotect.domain.LoginFailVO;
import cn.morefocus.base.module.support.securityprotect.service.ProtectLoginService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.validation.Valid;

/**
 * 网络安全
 */

@RestController
@Tag(name = SwaggerTagConst.Support.PROTECT)
public class AdminProtectController extends SupportBaseController {

    @Resource
    private ProtectLoginService protectLoginService;

    @Operation(summary = "分页查询 @author 1024创新实验室-主任-卓大")
    @PostMapping("/protect/loginFail/queryPage")
    public R<PageResult<LoginFailVO>> queryPage(@RequestBody @Valid LoginFailQueryForm queryForm) {
        return R.ok(protectLoginService.queryPage(queryForm));
    }

    @Operation(summary = "批量删除 @author 1024创新实验室-主任-卓大")
    @PostMapping("/protect/loginFail/batchDelete")
    public R<String> batchDelete(@RequestBody ValidateList<Long> idList) {
        return protectLoginService.batchDelete(idList);
    }

}
