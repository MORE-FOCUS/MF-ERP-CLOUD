package cn.morefocus.base.config;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.env.EnvironmentPostProcessor;
import org.springframework.boot.env.YamlPropertySourceLoader;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.core.env.MutablePropertySources;
import org.springframework.core.env.PropertySource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import java.io.IOException;
import java.util.List;

/**
 * yaml 读取配置
 *
 * @author loki
 */
@Configuration
@Slf4j
@Order(value = 0)
public class YamlProcessor implements EnvironmentPostProcessor {
    private final static String DEFAULT_LOG_PATH = "./logs/";
    private final static String LOG_PATH = "project.log-path";
    private final static String RESOURCE_PATH = "classpath*:mf-*.yaml";

    private final YamlPropertySourceLoader loader = new YamlPropertySourceLoader();

    @Override
    public void postProcessEnvironment(ConfigurableEnvironment environment, SpringApplication application) {
        String filePath = environment.getProperty(LOG_PATH);
        System.setProperty("project.log-path", StringUtils.isBlank(filePath) ? DEFAULT_LOG_PATH : filePath);

        this.loadProperty(environment.getPropertySources());
    }

    private void loadProperty(MutablePropertySources propertySources) {
        PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
        try {
            Resource[] resources = resolver.getResources(RESOURCE_PATH);
            if (resources.length < 1) {
                return;
            }

            for (Resource resource : resources) {
                log.info("初始化系统配置：{}", resource.getFilename());
                List<PropertySource<?>> load = loader.load(resource.getFilename(), resource);
                load.forEach(propertySources::addLast);
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


}