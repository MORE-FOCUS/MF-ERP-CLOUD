package cn.morefocus.base.module.support.captcha.controller;

import cn.morefocus.base.common.controller.SupportBaseController;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.constant.SwaggerTagConst;
import cn.morefocus.base.module.support.captcha.domain.CaptchaVO;
import cn.morefocus.base.module.support.captcha.service.CaptchaService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * 图形验证码业务
 *
 *
 */
@Tag(name = SwaggerTagConst.Support.CAPTCHA)
@RestController
public class CaptchaController extends SupportBaseController {

    @Resource
    private CaptchaService captchaService;

    @Operation(summary = "获取图形验证码 ")
    @GetMapping("/captcha")
    public R<CaptchaVO> generateCaptcha() {
        return R.ok(captchaService.generateCaptcha());
    }

}
