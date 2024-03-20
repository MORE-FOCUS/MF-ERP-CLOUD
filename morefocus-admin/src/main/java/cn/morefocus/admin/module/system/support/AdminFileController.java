package cn.morefocus.admin.module.system.support;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.morefocus.base.common.controller.SupportBaseController;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.constant.SwaggerTagConst;
import cn.morefocus.base.module.support.file.domain.form.FileQueryForm;
import cn.morefocus.base.module.support.file.domain.vo.FileVO;
import cn.morefocus.base.module.support.file.service.FileService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.validation.Valid;

/**
 * 文件服务
 *
 * @author loki
 */
@RestController
@Tag(name = SwaggerTagConst.Support.FILE)
public class AdminFileController extends SupportBaseController {

    @Resource
    private FileService fileService;

    @Operation(summary = "分页查询 @author 1024创新实验室-主任-卓大")
    @PostMapping("/file/queryPage")
    @SaCheckPermission("support:file:query")
    public R<PageResult<FileVO>> queryPage(@RequestBody @Valid FileQueryForm queryForm) {
        return R.ok(fileService.queryPage(queryForm));
    }

}
