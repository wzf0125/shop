package org.gdufs.shop.controller.buyer;

import org.gdufs.shop.bean.JsonResponse;
import org.gdufs.shop.constants.Roles;
import org.gdufs.shop.controller.BaseController;
import org.gdufs.shop.dto.PageParamDTO;
import org.gdufs.shop.interceptor.RequiredPermission;
import org.gdufs.shop.service.GoodsService;
import org.gdufs.shop.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Description:
 * Param:
 * return:
 * Author: wzf
 * Date: 2022/12/12
 */
@RestController
@RequiredPermission({Roles.BUYER})
@RequestMapping("/buyer/rank")
public class BuyerRankController extends BaseController {
    @Autowired
    GoodsService goodsService;

    /**
     * [B014]获取购买数量排行榜
     * GET /buyer/rank/purchase
     * 接口ID：54174229
     * 接口地址：https://www.apifox.cn/web/project/2067016/apis/api-54174229
     */
    @GetMapping("/purchase")
    public JsonResponse<Object> orderByPurchase(@Validated PageParamDTO params) {
        return JsonResponse.success(goodsService.getGoodsOderByPurchase(params));
    }

    /**
     * [B015]获取浏览量排行
     * GET /buyer/rank/view
     * 接口ID：54174230
     * 接口地址：https://www.apifox.cn/web/project/2067016/apis/api-54174230
     */
    @GetMapping("/view")
    public JsonResponse<Object> orderByView(@Validated PageParamDTO params) {
        return JsonResponse.success(goodsService.getGoodsOderByView(params));
    }
}
