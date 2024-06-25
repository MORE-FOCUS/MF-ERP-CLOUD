package cn.morefocus.admin.module.business.spu.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.morefocus.admin.constants.AdminSwaggerTagConst;
import cn.morefocus.admin.module.business.spu.domain.form.SpuUnitPageQueryForm;
import cn.morefocus.admin.module.business.spu.domain.form.SpuUnitQueryForm;
import cn.morefocus.admin.module.business.spu.domain.vo.SpuUnitVO;
import cn.morefocus.admin.module.business.spu.service.SpuUnitService;
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
 * 单位 Controller
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Tag(name = AdminSwaggerTagConst.Business.SPU_UNIT)
@RestController
public class SpuUnitController {

    @Resource
    private SpuUnitService spuUnitService;

    /**
     * 分页查询
     */
    @Operation(summary = "查询分页列表")
    @PostMapping("/spu-unit/queryPage")
    @SaCheckPermission("business:spu-unit:query")
    public R<PageResult<SpuUnitVO>> queryPage(@RequestBody @Valid SpuUnitPageQueryForm queryForm) {
        return R.ok(spuUnitService.queryPage(queryForm));
    }

    /**
     * 查询所有
     */
    @PostMapping("/spu-unit/queryAll")
    @SaCheckPermission("business:spu-unit:query")
    public R<List<SpuUnitVO>> queryAll(@RequestBody SpuUnitQueryForm queryForm) {
        return R.ok(spuUnitService.queryAll(queryForm));
    }

    /**
     * 更新禁用/启用状态
     */
    @Operation(summary = "更新禁用/启用状态")
    @PostMapping("/spu-unit/disabled/{id}")
    @SaCheckPermission("business:spu-unit:disabled")
    public R<String> updateIsDisabled(@PathVariable("id") Long id) {
        return spuUnitService.updateIsDisabled(id);
    }
}
