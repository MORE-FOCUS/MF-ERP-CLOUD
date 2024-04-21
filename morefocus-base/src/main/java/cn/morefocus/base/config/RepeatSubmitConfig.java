package cn.morefocus.base.config;

import cn.morefocus.base.common.constant.StringConst;
import cn.morefocus.base.common.util.SecurityContextHolder;
import cn.morefocus.base.module.support.repeatsubmit.RepeatSubmitAspect;
import cn.morefocus.base.module.support.repeatsubmit.ticket.RepeatSubmitCaffeineTicket;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 重复提交配置
 *
 *
 */
@Configuration
public class RepeatSubmitConfig {

    @Bean
    public RepeatSubmitAspect repeatSubmitAspect() {
        RepeatSubmitCaffeineTicket caffeineTicket = new RepeatSubmitCaffeineTicket(this::ticket);
        return new RepeatSubmitAspect(caffeineTicket);
    }

    /**
     * 获取指明某个用户的凭证
     */
    private String ticket(String servletPath) {
        Long userId = SecurityContextHolder.getUserId();
        if (null == userId) {
            return StringConst.EMPTY;
        }
        return servletPath + "_" + userId;
    }
}
