package org.gdufs.shop.controller;

import org.gdufs.shop.bean.JsonResponse;
import org.gdufs.shop.exception.ApiException;
import org.gdufs.shop.service.CommonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;

/**
 * Description:
 * Param:
 * return:
 * Author: wzf
 * Date: 2022/12/19
 */
@RestController
@RequestMapping("/common")
public class CommonController extends BaseController {
    @Autowired
    CommonService commonService;
    /**
     * 发送邮件
     */
    @PostMapping("/sendEmailCode")
    public JsonResponse<Object> sendEmailCode(@Validated @NotNull @Email String mail,
                                              @Validated @NotNull String type) {
        if(!type.equals("buyer")&&!type.equals("seller")){
            throw new ApiException("参数错误");
        }
        commonService.sendEmailCode(mail, type);
        return JsonResponse.success("发送成功");
    }
}
