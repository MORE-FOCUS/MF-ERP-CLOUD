package cn.morefocus.base.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.SchedulingConfigurer;
import org.springframework.scheduling.config.ScheduledTaskRegistrar;
import org.springframework.scheduling.config.Task;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 定时任务调度 配置
 */
@Slf4j
@Configuration
public class ScheduleConfig implements SchedulingConfigurer {

    private ScheduledTaskRegistrar scheduledTaskRegistrar;

    @Override
    public void configureTasks(ScheduledTaskRegistrar scheduledTaskRegistrar) {
        this.scheduledTaskRegistrar = scheduledTaskRegistrar;
    }

    public String destroy() {
        List<Task> taskList = new ArrayList<>();
        taskList.addAll(scheduledTaskRegistrar.getCronTaskList());
        taskList.addAll(scheduledTaskRegistrar.getTriggerTaskList());
        taskList.addAll(scheduledTaskRegistrar.getFixedDelayTaskList());
        taskList.addAll(scheduledTaskRegistrar.getFixedRateTaskList());

        scheduledTaskRegistrar.destroy();

        List<String> taskNameList = taskList.stream().map(Task::toString).collect(Collectors.toList());
        return "已关闭 @Scheduled定时任务：" + taskNameList.size() + "个！";
    }

}
