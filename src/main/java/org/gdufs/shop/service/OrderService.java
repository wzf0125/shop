package org.gdufs.shop.service;

import org.gdufs.shop.dto.PageParamDTO;
import org.gdufs.shop.entity.Goods;
import org.gdufs.shop.entity.Order;
import com.baomidou.mybatisplus.extension.service.IService;
import org.gdufs.shop.entity.OrderGoods;
import org.gdufs.shop.utils.PageResult;
import org.gdufs.shop.vo.OrderGoodsVO;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author wzf
 * @since 2022-12-12
 */
public interface OrderService extends IService<Order> {
    // 结算购物车 添加未支付订单
    void addUnpaidOrder(long uid);

    // 获取用户订单列表
    PageResult<OrderGoodsVO> getBuyerOrderList(Long id, PageParamDTO params);

    // 获取用户详情
    OrderGoodsVO getBuyerOrder(Long uid, Long buyerId);

    // 支付
    void pay(Long uid,Long orderId);

    // 取消订单
    void cancelOrder(Long uid,Long orderId);

    // 获取商家订单
    PageResult<OrderGoodsVO> getSellerOrderList(Long id,PageParamDTO params);

    // 发货
    void deliverGoods(Long uid,Long orderId);
}
