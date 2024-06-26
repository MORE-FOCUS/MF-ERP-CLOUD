package cn.morefocus.base.module.support.apiencrypt.advice;

import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.enums.DataTypeEnum;
import cn.morefocus.base.module.support.apiencrypt.annotation.ApiEncrypt;
import cn.morefocus.base.module.support.apiencrypt.service.ApiEncryptService;
import com.alibaba.fastjson.JSON;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.MethodParameter;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyAdvice;

import javax.annotation.Resource;

/**
 * 加密
 *
 *
 */

@Slf4j
@ControllerAdvice
public class EncryptResponseAdvice implements ResponseBodyAdvice<R> {

    @Resource
    private ApiEncryptService apiEncryptService;

    @Override
    public boolean supports(MethodParameter returnType, Class<? extends HttpMessageConverter<?>> converterType) {
        return returnType.hasMethodAnnotation(ApiEncrypt.class) || returnType.getContainingClass().isAnnotationPresent(ApiEncrypt.class);
    }

    @Override
    public R beforeBodyWrite(R body, MethodParameter returnType, MediaType selectedContentType, Class<? extends HttpMessageConverter<?>> selectedConverterType, ServerHttpRequest request, ServerHttpResponse response) {
        if (null == body || body.getData() == null) {
            return body;
        }

        String encrypt = apiEncryptService.encrypt(JSON.toJSONString(body.getData()));
        body.setData(encrypt);
        body.setDataType(DataTypeEnum.ENCRYPT.getValue());
        return body;
    }
}


