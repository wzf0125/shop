package org.gdufs.shop.exception;

import com.alibaba.fastjson.JSON;
import lombok.extern.slf4j.Slf4j;
import org.gdufs.shop.bean.JsonResponse;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.annotation.Order;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.validation.ValidationException;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Quantacenter
 * @description
 * @date 2021/12/5
 */
@Slf4j
@Order(0)
@ControllerAdvice
public class GlobalExceptionHandler {


    @Value("${isDebug}")
    private boolean isDebug;

    @ExceptionHandler(Exception.class)
    public @ResponseBody
    JsonResponse<Object> errorResult(Exception e) throws IOException {
        log.error(e.getMessage());
        if (isDebug) { // 本地调试只输出错误信息
            e.printStackTrace();
            // debug模式下返回错误信息
            return JsonResponse.error(e.getMessage());
        }
        // 非debug模式仅提示服务器内部错误
        return JsonResponse.error();
    }

    // 数据校验异常
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public @ResponseBody
    JsonResponse<Object> validationErrorResult(MethodArgumentNotValidException e) {
        BindingResult result = e.getBindingResult();
        StringBuffer sb = new StringBuffer();
        if (result.getFieldErrorCount() > 0) {
            List<FieldError> fieldErrors = result.getFieldErrors();
            for (FieldError fieldError : fieldErrors) {
                sb.append(fieldError.getDefaultMessage());
            }
        }
        return JsonResponse.paramError(String.format("参数校验错误[%s]", sb));
    }

    // 数据校验异常
    @ExceptionHandler(ValidationException.class)
    public @ResponseBody
    JsonResponse<Object> validationErrorResult(ValidationException e) {
        return JsonResponse.paramError(String.format("参数校验错误[%s]", e.getMessage()));
    }

    // 自定义异常处理类
    @ExceptionHandler(ApiException.class)
    public @ResponseBody
    JsonResponse<Object> apiErrorResult(ApiException e) {
        return JsonResponse.failed(e.getMessage());
    }

}
