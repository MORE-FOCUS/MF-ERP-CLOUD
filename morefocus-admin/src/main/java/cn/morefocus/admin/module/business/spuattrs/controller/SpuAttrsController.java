package cn.morefocus.admin.module.business.spuattrs.controller;

import cn.morefocus.admin.constant.AdminSwaggerTagConst;
import cn.morefocus.admin.module.business.spuattrs.service.SpuAttrsService;
import io.swagger.v3.oas.annotations.tags.Tag;
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
}
