package org.gdufs.shop.log;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.UUID;

/**
 * @description
 * @author Quantacenter
 */
@Aspect
@Component
public class RequestLogAspect {

    private final Logger logger = LoggerFactory.getLogger(getClass());

    public static final String LOG_TEMPLATE = "LogId: {} | Request URL: {} | Http Method: {} | URL: {} | IP: {} | Class Method: {} | Args: {} | Token: {} | Msg: {}";

    @Pointcut("execution(public * org.gdufs.shop.controller..*.*(..))")
    public void requestLog() {
        // 拦截控制器所有方法
    }

    @Before("requestLog()")
    public void doBefore(JoinPoint joinPoint) {
        String logId = String.valueOf(UUID.randomUUID());
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        if (attributes != null) {
            HttpServletRequest request = attributes.getRequest();
            request.setAttribute("requestId", logId);
            String args = Arrays.toString(joinPoint.getArgs());
            request.setAttribute("args", args);
            logger.info(LOG_TEMPLATE,
                    logId,
                    request.getRequestURL().toString(),
                    request.getMethod(),
                    request.getRemoteAddr(),
                    request.getHeader("X-Real-IP"),
                    joinPoint.getSignature().getDeclaringTypeName() + "." + joinPoint.getSignature().getName(),
                    args,
                    request.getHeader("Token"),
                    "");
        } else {
            logger.info(LOG_TEMPLATE, logId, "", "", "", "", "", "", "Empty Request!");
        }
    }
}
