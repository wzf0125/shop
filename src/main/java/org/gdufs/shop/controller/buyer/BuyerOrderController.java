package org.gdufs.shop.controller.buyer;

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
@RequiredPermission({Roles.BUYER})
@RequestMapping("/buyer/order")
public class BuyerOrderController extends BaseController {
    @Autowired
    OrderService orderService;

    /**
     * [B009]结算购物车
     * POST /buyer/order
     * 接口ID：54174222
     * 接口地址：https://www.apifox.cn/web/project/2067016/apis/api-54174222
     */
    @PostMapping
    public JsonResponse<Object> addUnpaidOrder() {
        orderService.addUnpaidOrder(getUid());
        return JsonResponse.success();
    }

    /**
     * [B010]取消订单
     * DELETE /buyer/order/{id}
     * 接口ID：54174225
     * 接口地址：https://www.apifox.cn/web/project/2067016/apis/api-54174225
     */
    @DeleteMapping("/{id}")
    public JsonResponse<Object> cancelOrder(@PathVariable Long id) {
        orderService.cancelOrder(getUid(), id);
        return JsonResponse.success();
    }

    /**
     * [B011]获取订单信息
     * GET /buyer/order/id
     * 接口ID：54174226
     * 接口地址：https://www.apifox.cn/web/project/2067016/apis/api-54174226
     */
    @GetMapping("/{id}")
    public JsonResponse<Object> getOrder(@PathVariable Long id) {
        return JsonResponse.success(orderService.getBuyerOrder(getUid(), id));
    }

    /**
     * [B012]支付订单
     * POST /buyer/order/pay/{id}
     * 接口ID：54174228
     * 接口地址：https://www.apifox.cn/web/project/2067016/apis/api-54174228
     */
    @PostMapping("/pay/{id}")
    public JsonResponse<Object> pay(@PathVariable Long id) {
        orderService.pay(getUid(), id);
        return JsonResponse.success();
    }

    /**
     * [B013]获取订单列表
     * GET /buyer/order/list
     * 接口ID：54174242
     * 接口地址：https://www.apifox.cn/web/project/2067016/apis/api-54174242
     */
    @GetMapping("/list")
    public JsonResponse<Object> paidOrderList(@Validated PageParamDTO params) {
        return JsonResponse.success(orderService.getBuyerOrderList(getUid(), params));
    }


}
