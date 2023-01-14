package org.gdufs.shop.controller.buyer;

import org.gdufs.shop.bean.JsonResponse;
import org.gdufs.shop.constants.Roles;
import org.gdufs.shop.controller.BaseController;
import org.gdufs.shop.dto.LoginDTO;
import org.gdufs.shop.dto.RegisterDTO;
import org.gdufs.shop.interceptor.RequiredPermission;
import org.gdufs.shop.service.BuyerService;
import org.gdufs.shop.utils.TokenUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * Description:
 * Param:
 * return:
 * Author: wzf@RequiredPermission({Roles.SELLER})
 * Date: 2022/12/12
 */
@RestController
@RequiredPermission({Roles.BUYER})
@RequestMapping("/buyer")
public class BuyerController extends BaseController {
    @Autowired
    BuyerService buyerService;
    @Autowired
    TokenUtils tokenUtils;

    /**
     * [B001]登录
     * POST /buyer/login
     * 接口ID：54174208
     * 接口地址：https://www.apifox.cn/web/project/2067016/apis/api-54174208
     */
    @PostMapping("/login")
    public JsonResponse<Object> login(@RequestBody @Validated LoginDTO param) {
        String token = buyerService.login(param);
        Map<String, String> res = new HashMap<>();
        res.put("Token", token);
        return JsonResponse.success(res);
    }

    /**
     * [B002]注册
     * POST /buyer/register
     * 接口ID：54174209
     * 接口地址：https://www.apifox.cn/web/project/2067016/apis/api-54174209
     */
    @PostMapping("/register")
    public JsonResponse<Object> register(@Validated @RequestBody RegisterDTO param) {
        buyerService.register(param);
        return JsonResponse.success();
    }

    /**
     * [B003]登出
     * DELETE /buyer/exit
     * 接口ID：54174210
     * 接口地址：https://www.apifox.cn/web/project/2067016/apis/api-54174210
     */
    @DeleteMapping("/exit")
    public JsonResponse<Object> exit() {
        tokenUtils.safeExit(getUid(), getRole());
        return JsonResponse.success();
    }

}
