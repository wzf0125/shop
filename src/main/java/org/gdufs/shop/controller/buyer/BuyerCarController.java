package org.gdufs.shop.controller.buyer;

import org.gdufs.shop.bean.JsonResponse;
import org.gdufs.shop.constants.Roles;
import org.gdufs.shop.controller.BaseController;
import org.gdufs.shop.dto.AddGoods2CarDTO;
import org.gdufs.shop.interceptor.RequiredPermission;
import org.gdufs.shop.service.BuyerService;
import org.gdufs.shop.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * Description:
 * Param:
 * return:
 * Author: wzf
 * Date: 2022/12/13
 */
@RestController
@RequiredPermission({Roles.BUYER})
@RequestMapping("/buyer/car")
public class BuyerCarController extends BaseController {
    @Autowired
    GoodsService goodsService;

    /**
     * [B006]添加至购物车
     * POST /buyer/car
     * 接口ID：54174219
     * 接口地址：https://www.apifox.cn/web/project/2067016/apis/api-54174219
     */
    @PostMapping
    public JsonResponse<Object> addGoods2Car(@RequestBody @Validated AddGoods2CarDTO param) {
        goodsService.addGoods2Car(getUid(), param);
        return JsonResponse.success();
    }

    /**
     * [B007]从购物车移除商品
     * DELETE /buyer/car/{id}
     * 接口ID：54174221
     * 接口地址：https://www.apifox.cn/web/project/2067016/apis/api-54174221
     */
    @DeleteMapping("/{id}")
    public JsonResponse<Object> removeGoods(@PathVariable Long id) {
        goodsService.removeCarGoods(getUid(), id);
        return JsonResponse.success();
    }

    /**
     * [B008]获取购物车商品列表
     * GET /buyer/car
     * 接口ID：54174220
     * 接口地址：https://www.apifox.cn/web/project/2067016/apis/api-54174220
     */
    @GetMapping
    public JsonResponse<Object> getCarGoodsList() {
        return JsonResponse.success(goodsService.getGarGoodsList(getUid()));
    }
}
