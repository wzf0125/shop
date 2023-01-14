package org.gdufs.shop.controller.seller;

import org.gdufs.shop.bean.JsonResponse;
import org.gdufs.shop.constants.Roles;
import org.gdufs.shop.controller.BaseController;
import org.gdufs.shop.dto.LoginDTO;
import org.gdufs.shop.dto.RegisterDTO;
import org.gdufs.shop.interceptor.RequiredPermission;
import org.gdufs.shop.service.SellerService;
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
 * Author: wzf
 * Date: 2022/12/12
 */
@RestController
@RequiredPermission({Roles.SELLER})
@RequestMapping("/seller")
public class SellerController extends BaseController {
    @Autowired
    SellerService sellerService;
    @Autowired
    TokenUtils tokenUtils;

    /**
     * [S001]登录
     * POST /seller/login
     * 接口ID：54174234
     * 接口地址：https://www.apifox.cn/web/project/2067016/apis/api-54174234
     */
    @PostMapping("/login")
    public JsonResponse<Object> login(@RequestBody @Validated LoginDTO param) {
        String token = sellerService.login(param);
        Map<String, String> res = new HashMap<>();
        res.put("Token", token);
        return JsonResponse.success(res);
    }

    /**
     * [S002a]注册
     * POST /seller/register
     * 接口ID：54174233
     * 接口地址：https://www.apifox.cn/web/project/2067016/apis/api-54174233
     */
    @PostMapping("/register")
    public JsonResponse<Object> register(@Validated @RequestBody RegisterDTO param) {
        System.out.println(param);
        sellerService.register(param);
        return JsonResponse.success();
    }

    /**
     * [S003]登出
     * DELETE /seller/exit
     * 接口ID：54174232
     * 接口地址：https://www.apifox.cn/web/project/2067016/apis/api-54174232
     */
    @DeleteMapping("/exit")
    public JsonResponse<Object> exit() {
        tokenUtils.safeExit(getUid(), getRole());
        return JsonResponse.success();
    }
}
