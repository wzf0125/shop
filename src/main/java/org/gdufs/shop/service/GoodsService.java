package org.gdufs.shop.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.gdufs.shop.constants.RedisPrefix;
import org.gdufs.shop.dto.AddGoods2CarDTO;
import org.gdufs.shop.dto.AddGoodsDTO;
import org.gdufs.shop.dto.EditGoodsDTO;
import org.gdufs.shop.dto.PageParamDTO;
import org.gdufs.shop.entity.Goods;
import com.baomidou.mybatisplus.extension.service.IService;
import org.gdufs.shop.entity.Order;
import org.gdufs.shop.utils.PageResult;
import org.gdufs.shop.vo.CarVO;

import java.util.List;
import java.util.Set;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author wzf
 * @since 2022-12-12
 */
public interface GoodsService extends IService<Goods> {
    // 分页获取商家商品列表
    PageResult<Goods> getSellerGoodsList(Long sellerId, PageParamDTO param);

    // 分页获取商品列表
    PageResult<Goods> getGoodsList(PageParamDTO param);

    // 添加商品
    void addGoods(Long sellerId, AddGoodsDTO params);

    // 获取商品详情
    Goods getGoodsInfo(Long id);

    // 编辑商品
    void editGoods(EditGoodsDTO params);

    // 删除商品
    void deleteGoods(Long id);

    // 添加商品至购物车
    void addGoods2Car(long uid, AddGoods2CarDTO param);

    // 从购物车中移除商品
    void removeCarGoods(long uid, long goodIs);

    // 获取购物车中的商品
    List<CarVO> getGarGoodsList(long uid);

    // 获取商品购买量排行
    List<Goods> getGoodsOderByPurchase(PageParamDTO params);

    // 获取商品浏览量排行
    List<Goods> getGoodsOderByView(PageParamDTO params);

}
