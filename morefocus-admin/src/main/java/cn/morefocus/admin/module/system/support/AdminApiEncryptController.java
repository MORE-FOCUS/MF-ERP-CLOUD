package cn.morefocus.admin.module.system.support;

import cn.morefocus.base.common.controller.SupportBaseController;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.domain.ValidateList;
import cn.morefocus.base.constant.SwaggerTagConst;
import cn.morefocus.base.module.support.apiencrypt.annotation.ApiDecrypt;
import cn.morefocus.base.module.support.apiencrypt.annotation.ApiEncrypt;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.Data;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * api 加密
 *
 * @author loki
 */

@RestController
@Tag(name = SwaggerTagConst.Support.PROTECT)
public class AdminApiEncryptController extends SupportBaseController {


    @ApiDecrypt
    @PostMapping("/apiEncrypt/testRequestEncrypt")
    @Operation(summary = "测试 请求加密")
    public R<JweForm> testRequestEncrypt(@RequestBody @Valid JweForm form) {
        return R.ok(form);
    }

    @ApiEncrypt
    @PostMapping("/apiEncrypt/testResponseEncrypt")
    @Operation(summary = "测试 返回加密")
    public R<JweForm> testResponseEncrypt(@RequestBody @Valid JweForm form) {
        return R.ok(form);
    }

    @ApiDecrypt
    @ApiEncrypt
    @PostMapping("/apiEncrypt/testDecryptAndEncrypt")
    @Operation(summary = "测试 请求参数加密和解密、返回数据加密和解密")
    public R<JweForm> testDecryptAndEncrypt(@RequestBody @Valid JweForm form) {
        return R.ok(form);
    }

    @ApiDecrypt
    @ApiEncrypt
    @PostMapping("/apiEncrypt/testArray")
    @Operation(summary = "测试 数组加密和解密")
    public R<List<JweForm>> testArray(@RequestBody @Valid ValidateList<JweForm> list) {
        return R.ok(list);
    }


    @Data
    public static class JweForm {

        @NotBlank(message = "姓名 不能为空")
        String name;

        @NotNull
        @Min(value = 1)
        Integer age;

    }

}
