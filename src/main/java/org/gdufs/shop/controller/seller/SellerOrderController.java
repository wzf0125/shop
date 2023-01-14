package org.gdufs.shop.controller.seller;

import org.gdufs.shop.bean.JsonResponse;
import org.gdufs.shop.constants.Roles;
import org.gdufs.shop.controller.BaseController;
import org.gdufs.shop.dto.PageParamDTO;
import org.gdufs.shop.interceptor.RequiredPermission;
import org.gdufs.shop.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * Description:
 * Param:
 * return:
 * Author: wzf
 * Date: 2022/12/12
 */
@RestController
@RequiredPermission({Roles.SELLER})
@RequestMapping("/seller/order")
public class SellerOrderController extends BaseController {
    @Autowired
    OrderService orderService;

    /**
     * [S009]获取订单列表
     * GET /seller/order
     * 接口ID：54174244
     * 接口地址：https://www.apifox.cn/web/project/2067016/apis/api-54174244
     */
    @GetMapping
    public JsonResponse<Object> getOrderList(@Validated PageParamDTO params) {
        return JsonResponse.success(orderService.getSellerOrderList(getUid(), params));
    }

    /**
     * [S010]订单发货
     * PUT /seller/order/{id}
     * 接口ID：54174245
     * 接口地址：https://www.apifox.cn/web/project/2067016/apis/api-54174245
     */
    @PutMapping("/{id}")
    public JsonResponse<Object> sendGoods(@PathVariable Long id) {
        orderService.deliverGoods(getUid(), id);
        return JsonResponse.success();
    }

}
