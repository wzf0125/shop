package org.gdufs.shop.controller.seller;

import org.gdufs.shop.bean.JsonResponse;
import org.gdufs.shop.constants.Roles;
import org.gdufs.shop.controller.BaseController;
import org.gdufs.shop.dto.AddGoodsDTO;
import org.gdufs.shop.dto.EditGoodsDTO;
import org.gdufs.shop.dto.PageParamDTO;
import org.gdufs.shop.interceptor.RequiredPermission;
import org.gdufs.shop.service.GoodsService;
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
@RequestMapping("/seller/goods")
public class SellerGoodsController extends BaseController {
    @Autowired
    GoodsService goodsService;

    /**
     * [S004]获取店铺商品列表
     * GET /seller/goods
     * 接口ID：54174239
     * 接口地址：https://www.apifox.cn/web/project/2067016/apis/api-54174239
     */
    @GetMapping
    public JsonResponse<Object> getGoodsList(@Validated PageParamDTO params) {
        return JsonResponse.success(goodsService.getSellerGoodsList(getUid(), params));
    }

    /**
     * [S006]添加商品
     * POST /seller/goods
     * 接口ID：54174235
     * 接口地址：https://www.apifox.cn/web/project/2067016/apis/api-54174235
     */
    @PostMapping
    public JsonResponse<Object> addGoods(@RequestBody @Validated AddGoodsDTO params) {
        goodsService.addGoods(getUid(),params);
        return JsonResponse.success("添加商品成功");
    }

    /**
     * [S005]获取商品详情
     * GET /seller/goods/{id}
     * 接口ID：54174240
     * 接口地址：https://www.apifox.cn/web/project/2067016/apis/api-54174240
     */
    @GetMapping("/{id}")
    public JsonResponse<Object> getGoods(@PathVariable Long id) {
        return JsonResponse.success(goodsService.getGoodsInfo(id));
    }

    /**
     * [S007]编辑商品
     * PUT /seller/goods
     * 接口ID：54174238
     * 接口地址：https://www.apifox.cn/web/project/2067016/apis/api-54174238
     */
    @PutMapping
    public JsonResponse<Object> editGoods(@RequestBody @Validated EditGoodsDTO params) {
        goodsService.editGoods(params);
        return JsonResponse.success("编辑成功");
    }

    /**
     * [S008]删除商品
     * DELETE /seller/goods/{id}
     * 接口ID：54174241
     * 接口地址：https://www.apifox.cn/web/project/2067016/apis/api-54174241
     */
    @DeleteMapping("/{id}")
    public JsonResponse<Object> deleteGoods(@PathVariable Long id) {
        goodsService.deleteGoods(id);
        return JsonResponse.success("删除成功");
    }

}
