package cn.morefocus.base.module.support.quartz.task;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

/**
 * 临时任务
 */
@Slf4j
@Component("tempTask")
public class TempTask {
    /**
     * 定时任务测试
     */
    public void test() {
        log.info("[定时任务]测试");
    }
}
