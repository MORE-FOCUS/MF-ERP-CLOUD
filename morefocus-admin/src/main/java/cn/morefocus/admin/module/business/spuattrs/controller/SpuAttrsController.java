package cn.morefocus.admin.module.business.spuattrs.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.morefocus.admin.constant.AdminSwaggerTagConst;
import cn.morefocus.admin.module.business.spuattrs.domain.form.SpuAttrsForm;
import cn.morefocus.admin.module.business.spuattrs.domain.vo.SpuAttrsVO;
import cn.morefocus.admin.module.business.spuattrs.service.SpuAttrsService;
import cn.morefocus.base.common.domain.R;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

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
     * 查询所有
     */
    @PostMapping("/spu-attrs/{spuId}")
    public R<SpuAttrsVO> querySpuAttrs(@PathVariable("spuId") Long spuId) {
        return R.ok(spuAttrsService.querySpuAttrs(spuId));
    }

    /**
     * 更新禁用/启用状态
     */
    @Operation(summary = "更新禁用/启用状态")
    @PostMapping("/spu-attrs/update")
    @SaCheckPermission("business:spu-attrs:disabled")
    public R<String> updateIsDisabled(@RequestBody SpuAttrsForm form) {
        spuAttrsService.updateSpuAttrs(form);
        return R.ok();
    }
}
