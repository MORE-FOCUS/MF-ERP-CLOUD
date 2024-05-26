package cn.morefocus.admin.module.business.spuattrs.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.morefocus.admin.constant.AdminSwaggerTagConst;
import cn.morefocus.admin.module.business.spuattrs.domain.form.SpuAttrsPageQueryForm;
import cn.morefocus.admin.module.business.spuattrs.domain.form.SpuAttrsQueryForm;
import cn.morefocus.admin.module.business.spuattrs.domain.vo.SpuAttrsVO;
import cn.morefocus.admin.module.business.spuattrs.service.SpuAttrsService;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

/**
 * 商品附加属性 Controller
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Tag(name = AdminSwaggerTagConst.Business.SPU_ATTRS)
@RestController
public class SpuAttrsController {

    @Resource
    private SpuAttrsService spuAttrsService;

    /**
     * 分页查询
     */
    @Operation(summary = "查询分页列表")
    @PostMapping("/spu-attrs/queryPage")
    @SaCheckPermission("business:spu-attrs:query")
    public R<PageResult<SpuAttrsVO>> queryPage(@RequestBody @Valid SpuAttrsPageQueryForm queryForm) {
        return R.ok(spuAttrsService.queryPage(queryForm));
    }

    /**
     * 查询所有
     */
    @PostMapping("/spu-attrs/queryAll")
    @SaCheckPermission("business:spu-attrs:query")
    public R<List<SpuAttrsVO>> queryAll(@RequestBody SpuAttrsQueryForm queryForm) {
        return R.ok(spuAttrsService.queryAll(queryForm));
    }

    /**
     * 更新禁用/启用状态
     */
    @Operation(summary = "更新禁用/启用状态")
    @PostMapping("/spu-attrs/disabled/{id}")
    @SaCheckPermission("business:spu-attrs:disabled")
    public R<String> updateIsDisabled(@PathVariable("id") Long id) {
        return spuAttrsService.updateIsDisabled(id);
    }
}
