package org.gdufs.shop.controller.buyer;

import org.gdufs.shop.bean.JsonResponse;
import org.gdufs.shop.constants.RedisPrefix;
import org.gdufs.shop.constants.Roles;
import org.gdufs.shop.controller.BaseController;
import org.gdufs.shop.dto.PageParamDTO;
import org.gdufs.shop.entity.Goods;
import org.gdufs.shop.interceptor.RequiredPermission;
import org.gdufs.shop.service.GoodsService;
import org.gdufs.shop.utils.RedisUtils;
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
@RequestMapping("/buyer/goods")
public class BuyerGoodsController extends BaseController {
    @Autowired
    GoodsService goodsService;
    @Autowired
    RedisUtils redisUtils;

    /**
     * [B004[获取商品列表
     * GET /buyer/goods
     * 接口ID：54174211
     * 接口地址：https://www.apifox.cn/web/project/2067016/apis/api-54174211
     */
    @GetMapping
    public JsonResponse<Object> getGoodsList(@Validated PageParamDTO page) {
        return JsonResponse.success(goodsService.getGoodsList(page));
    }

    /**
     * [B005]获取商品详情
     * GET /buyer/goods/{id}
     * 接口ID：54174212
     * 接口地址：https://www.apifox.cn/web/project/2067016/apis/api-54174212
     */
    @GetMapping("/{id}")
    public JsonResponse<Object> getGoods(@PathVariable Long id) {
        Goods goodsInfo = goodsService.getGoodsInfo(id);
        // 记录浏览量
        redisUtils.zIncr(RedisPrefix.GOODS_VISIT_RANK, id, 1);
        return JsonResponse.success(goodsInfo);
    }


}
