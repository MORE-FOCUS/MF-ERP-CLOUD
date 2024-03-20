package cn.morefocus.base.config;

import cn.morefocus.base.common.constant.RequestHeaderConst;
import cn.morefocus.base.common.swagger.SmartOperationCustomizer;
import cn.morefocus.base.constant.SwaggerTagConst;
import io.swagger.v3.oas.models.Components;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.security.SecurityRequirement;
import io.swagger.v3.oas.models.security.SecurityScheme;
import lombok.extern.slf4j.Slf4j;
import org.springdoc.core.GroupedOpenApi;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Conditional;
import org.springframework.context.annotation.Configuration;

/**
 * springdoc-openapi 配置
 *
 * @author loki
 */
@Slf4j
@Configuration
@Conditional(SystemEnvironmentConfig.class)
public class SwaggerConfig {

    public static final String[] SWAGGER_WHITELIST = {
            "/swagger-ui/**",
            "/swagger-ui/index.html",
            "/swagger-ui.html",
            "/swagger-ui.html/**",
            "/v1/api-docs",
            "/v1/api-docs/**",
            "/doc.html",
    };

    @Bean
    public OpenAPI api() {
        return new OpenAPI()
                .components(components())
                .info(new Info()
                        .title("接口文档")
                        .contact(new Contact().name("MORE-FOCUS TEAM").email("morefocus@163.com").url("https://morefocus.cn"))
                        .version("v1")
                )
                .addSecurityItem(new SecurityRequirement().addList(RequestHeaderConst.TOKEN));
    }

    private Components components() {
        return new Components()
                .addSecuritySchemes(RequestHeaderConst.TOKEN, new SecurityScheme().type(SecurityScheme.Type.APIKEY).in(SecurityScheme.In.HEADER).name(RequestHeaderConst.TOKEN));
    }

    @Bean
    public GroupedOpenApi businessApi() {
        return GroupedOpenApi.builder()
                .group("业务接口")
                .pathsToMatch("/**")
                .pathsToExclude(SwaggerTagConst.Support.URL_PREFIX + "/**")
                .addOperationCustomizer(new SmartOperationCustomizer())
                .build();

    }

    @Bean
    public GroupedOpenApi supportApi() {
        return GroupedOpenApi.builder()
                .group("支撑接口(Support)")
                .pathsToMatch(SwaggerTagConst.Support.URL_PREFIX + "/**")
                .addOperationCustomizer(new SmartOperationCustomizer())
                .build();
    }
}
