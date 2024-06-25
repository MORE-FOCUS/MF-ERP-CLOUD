package cn.morefocus.base.module.support.operatelog.core;

import cn.hutool.core.util.StrUtil;
import cn.morefocus.base.common.constant.StringConst;
import cn.morefocus.base.common.domain.RequestUser;
import cn.morefocus.base.common.util.LocalIpUtil;
import cn.morefocus.base.common.util.SecurityContextHolder;
import cn.morefocus.base.module.support.operatelog.annotation.OperateLog;
import cn.morefocus.base.module.support.operatelog.domain.OperateLogEntity;
import cn.morefocus.base.module.support.operatelog.mapper.OperateLogMapper;
import com.alibaba.fastjson.JSON;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.boot.context.properties.bind.BindResult;
import org.springframework.context.ApplicationContext;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.ThreadPoolExecutor;

/**
 * 操作日志记录处理,对所有OperateLog注解的Controller进行操作日志监控
 */
@Slf4j
@Aspect
public abstract class OperateLogAspect {

    private static final String POINT_CUT = "@within(cn.morefocus.base.module.support.operatelog.annotation.OperateLog) " +
            "|| @annotation(cn.morefocus.base.module.support.operatelog.annotation.OperateLog)";

    @Resource
    private ApplicationContext applicationContext;

    private ThreadPoolTaskExecutor threadPoolTaskExecutor;

    public abstract OperateLogConfig getOperateLogConfig();

    public OperateLogAspect() {
        this.initThread();
    }

    @Pointcut(POINT_CUT)
    public void logPointCut() {
    }

    @AfterReturning(pointcut = "logPointCut()")
    public void doAfterReturning(JoinPoint joinPoint) {
        handleLog(joinPoint, null);
    }

    @AfterThrowing(value = "logPointCut()", throwing = "e")
    public void doAfterThrowing(JoinPoint joinPoint, Exception e) {
        handleLog(joinPoint, e);
    }

    /**
     * 初始化线程池
     */
    private void initThread() {
        OperateLogConfig config = getOperateLogConfig();
        int corePoolSize = Runtime.getRuntime().availableProcessors();
        if (null != config.getCorePoolSize()) {
            corePoolSize = config.getCorePoolSize();
        }
        threadPoolTaskExecutor = new ThreadPoolTaskExecutor();
        threadPoolTaskExecutor.initialize();
        threadPoolTaskExecutor.setCorePoolSize(corePoolSize);
        threadPoolTaskExecutor.setMaxPoolSize(corePoolSize * 2);
        threadPoolTaskExecutor.setQueueCapacity(1000);
        threadPoolTaskExecutor.setKeepAliveSeconds(60);
        threadPoolTaskExecutor.setThreadNamePrefix("sys-operate-log");
        threadPoolTaskExecutor.setRejectedExecutionHandler(new ThreadPoolExecutor.CallerRunsPolicy());
        threadPoolTaskExecutor.setWaitForTasksToCompleteOnShutdown(true);
    }

    protected void handleLog(final JoinPoint joinPoint, final Exception e) {
        try {
            OperateLog operateLog = this.getAnnotationLog(joinPoint);
            if (operateLog == null) {
                return;
            }
            this.submitLog(joinPoint, e);
        } catch (Exception ex) {
            log.error("保存操作日志异常:{}", ex.getMessage());
        }
    }

    private OperateLog getAnnotationLog(JoinPoint joinPoint) {
        Signature signature = joinPoint.getSignature();
        MethodSignature methodSignature = (MethodSignature) signature;
        Method method = methodSignature.getMethod();
        OperateLog classAnnotation = AnnotationUtils.findAnnotation(method.getDeclaringClass(), OperateLog.class);
        if (classAnnotation != null) {
            return classAnnotation;
        }
        return AnnotationUtils.findAnnotation(method, OperateLog.class);
    }

    /**
     * swagger tag
     */
    private Tag getApi(JoinPoint joinPoint) {
        Signature signature = joinPoint.getSignature();
        MethodSignature methodSignature = (MethodSignature) signature;
        Method method = methodSignature.getMethod();
        return AnnotationUtils.findAnnotation(method.getDeclaringClass(), Tag.class);
    }

    /**
     * swagger ApiOperation
     */
    private Operation getApiOperation(JoinPoint joinPoint) {
        Signature signature = joinPoint.getSignature();
        MethodSignature methodSignature = (MethodSignature) signature;
        Method method = methodSignature.getMethod();

        if (method != null) {
            return method.getAnnotation(Operation.class);
        }
        return null;
    }

    /**
     * 提交存储操作日志
     */
    private void submitLog(final JoinPoint joinPoint, final Throwable e) {
        HttpServletRequest request = ((ServletRequestAttributes) Objects.requireNonNull(RequestContextHolder.getRequestAttributes())).getRequest();
        RequestUser user = SecurityContextHolder.getRequestUser();
        if (user == null) {
            return;
        }

        Object[] args = joinPoint.getArgs();
        String params = buildParamString(args);
        String className = joinPoint.getTarget().getClass().getName();
        String methodName = joinPoint.getSignature().getName();
        String operateMethod = className + "." + methodName;
        String failReason = null;
        boolean successFlag = true;
        if (e != null) {
            successFlag = false;
            failReason = getExceptionString(e);
        }

        OperateLogEntity operateLogEntity =
                OperateLogEntity.builder()
                        .operateUserId(user.getUserId())
                        .operateUserType(user.getUserType().getValue())
                        .operateUserName(user.getUserName())
                        .url(request.getRequestURI())
                        .method(operateMethod)
                        .param(params)
                        .ip(user.getIp())
                        .ipRegion(LocalIpUtil.getRegion(user.getIp()))
                        .userAgent(user.getUserAgent())
                        .failReason(failReason)
                        .successFlag(successFlag).build();
        Operation apiOperation = this.getApiOperation(joinPoint);
        if (apiOperation != null) {
            operateLogEntity.setContent(apiOperation.summary());
        }

        Tag api = this.getApi(joinPoint);
        if (api != null) {
            String name = api.name();
            operateLogEntity.setModule(StrUtil.join(",", name));
        }

        threadPoolTaskExecutor.execute(() -> {
            this.saveLog(operateLogEntity);
        });
    }

    private String buildParamString(Object[] args) {
        if (args == null || args.length == 0) {
            return StringConst.EMPTY;
        }

        List<Object> filterArgs = new ArrayList<>();
        for (Object arg : args) {
            if (arg == null) {
                continue;
            }
            if (arg instanceof HttpServletRequest
                    || arg instanceof HttpServletResponse
                    || arg instanceof ModelAndView
                    || arg instanceof MultipartFile
                    || arg instanceof BindResult) {
                continue;
            }
            filterArgs.add(arg);
        }
        return JSON.toJSONString(filterArgs);
    }

    private String getExceptionString(Throwable e) {
        StringWriter sw = new StringWriter();
        try (PrintWriter pw = new PrintWriter(sw);) {
            e.printStackTrace(pw);
        }
        return sw.toString();
    }

    /**
     * 保存操作日志
     */
    private void saveLog(OperateLogEntity operateLogEntity) {
        OperateLogConfig operateLogConfig = getOperateLogConfig();
        if (operateLogConfig.getSaveFunction() == null) {
            OperateLogMapper mapper = applicationContext.getBean(OperateLogMapper.class);
            mapper.insert(operateLogEntity);
        }
        operateLogConfig.getSaveFunction().apply(operateLogEntity);
    }
}
