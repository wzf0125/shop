package org.gdufs.shop.service.serviceImpl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.gdufs.shop.constants.OrderConstants;
import org.gdufs.shop.constants.RedisPrefix;
import org.gdufs.shop.dto.PageParamDTO;
import org.gdufs.shop.entity.*;
import org.gdufs.shop.exception.ApiException;
import org.gdufs.shop.mapper.OrderGoodsMapper;
import org.gdufs.shop.mapper.OrderMapper;
import org.gdufs.shop.producer.BuyerNoticeProducer;
import org.gdufs.shop.producer.SellerNoticeProducer;
import org.gdufs.shop.service.GoodsService;
import org.gdufs.shop.service.OrderService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.gdufs.shop.utils.PageResult;
import org.gdufs.shop.utils.RedisUtils;
import org.gdufs.shop.vo.CarVO;
import org.gdufs.shop.vo.OrderGoodsVO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.stream.Collectors;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author wzf
 * @since 2022-12-12
 */
@Service
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements OrderService {
    @Autowired
    GoodsService goodsService;
    @Autowired
    RedisUtils redisUtils;
    @Autowired
    BuyerNoticeProducer buyerNoticeProducer;
    @Autowired
    OrderGoodsMapper orderGoodsMapper;
    @Autowired
    SellerNoticeProducer sellerNoticeProducer;

    // 结账并添加未支付订单
    @Override
    @Transactional
    public void addUnpaidOrder(long uid) {
        String lock = String.format(RedisPrefix.BUYER_ADD_ORDER_LOCK_PREFIX, uid);
        if (!redisUtils.setNx(lock, uid, 3)) {
            throw new ApiException("同时只能结算一辆购物车");
        }
        try {
            // 购物车商品列表
            List<CarVO> carGoodsList = goodsService.getGarGoodsList(uid);
            // 将商品按照卖家归类 将购物车订单分为一个卖家一个卖家的处理
            Map<Long, ArrayList<CarVO>> carGoodsMap = carGoodsList
                    .stream()
                    .collect(Collectors.toMap(
                            CarVO::getSellerId,
                            v -> {
                                ArrayList<CarVO> arrayList = new ArrayList<>();
                                arrayList.add(v);
                                return arrayList;
                            },
                            (ArrayList<CarVO> newValue, ArrayList<CarVO> oldValue) -> {
                                oldValue.addAll(newValue);
                                return oldValue;
                            }
                    ));
            // 异步处理订单
            carGoodsMap.forEach((k, v) -> {
                handleOrder(uid, k, v);
            });
            String car = String.format(RedisPrefix.BUYER_CAR_PREFIX, uid);
            // 清空购物车
            redisUtils.del(car);

        } catch (ApiException e) {
            throw new ApiException(e.getMessage());
        } catch (Exception e) {
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            log.error(e.getMessage());
            throw new ApiException(e.getMessage());
        }
        // 释放锁
        redisUtils.releaseNx(lock, uid);
    }


    // 异步订单处理功能
    @Async("taskExecutor")
    @Transactional
    void handleOrder(Long buyerId, Long sellerId, List<CarVO> goodList) {
        // 先插入订单
        Order order = new Order(buyerId, sellerId);
        save(order);

        goodList.forEach(g -> {
            // 开始进行秒杀操作
            String key = String.format(RedisPrefix.GOODS_STOCK_PREFIX, g.getId());
            long currentStock = redisUtils.decr(key, g.getQuantity());
            // 如果减库存后商品库存小于0则说明已售罄(进行有多少卖多少策略)
            if (currentStock < 0) {
                // 还原空值
                redisUtils.set(key, 0);
                // 判断用户抢到了多少个
                long total = g.getQuantity() + currentStock;
                // 用户抢到0个
                if (total <= 0) {
                    buyerNoticeProducer.produce(new BuyerNotice(buyerId, "您购买的商品[" + g.getName() + "]已售罄"));
                    return;
                }

                // 异步插入抢到的商品信息
                new Thread(() -> {
                    orderGoodsMapper.insert(new OrderGoods(order.getId(), g.getId(), total));
                    redisUtils.zIncr(RedisPrefix.GOODS_PURCHASE_RANK, g.getId(), total); // 放入商品销售数量(用于排行榜)
                    buyerNoticeProducer.produce(new BuyerNotice(buyerId, "您购买的商品[" + g.getName() + "]部分售罄，为您抢购到" + total + "件"));
                }).start();
                return;
            }
            // 如果库存足够则插入购买到的商品信息
            redisUtils.zIncr(RedisPrefix.GOODS_PURCHASE_RANK, g.getId(), g.getQuantity()); // 放入商品销售数量(用于排行榜)
            orderGoodsMapper.insert(new OrderGoods(order.getId(), g.getId(), g.getQuantity()));
        });
    }

    @Override
    public PageResult<OrderGoodsVO> getBuyerOrderList(Long id, PageParamDTO params) {
        // 分页查询
        Page<Order> page = page(new Page<>(params.getStart(), params.getPageSize())
                , new LambdaQueryWrapper<Order>()
                        .eq(Order::getBuyerId, id)
                        .select(Order::getId, Order::getSeller));
        List<OrderGoodsVO> orderGoodsList = new ArrayList<>();
        // 查询对应商品列表
        page.getRecords().forEach(e -> {
            OrderGoodsVO orderGoodsVO = new OrderGoodsVO();
            BeanUtils.copyProperties(e, orderGoodsVO);
            orderGoodsVO.setGoodsList(orderGoodsMapper.selectList(
                    new LambdaQueryWrapper<OrderGoods>()
                            .eq(OrderGoods::getOrderId, e.getId())));
            orderGoodsList.add(orderGoodsVO);
        });
        return new PageResult<>(orderGoodsList, page.getTotal(), page.getSize());
    }

    @Override
    public OrderGoodsVO getBuyerOrder(Long uid, Long orderId) {
        OrderGoodsVO orderGoodsVO = new OrderGoodsVO();
        Order order = getOne(new LambdaQueryWrapper<Order>()
                .eq(Order::getId, orderId)
                .eq(Order::getBuyerId, uid).select(Order::getId, Order::getSeller));
        if (order == null) {
            throw new ApiException("订单不存在");
        }
        BeanUtils.copyProperties(order, orderGoodsVO);
        orderGoodsVO.setGoodsList(orderGoodsMapper.selectList(
                new LambdaQueryWrapper<OrderGoods>()
                        .eq(OrderGoods::getOrderId, orderId)));
        return orderGoodsVO;
    }

    /**
     * 支付方法
     */
    @Override
    public void pay(Long uid, Long orderId) {
        Order order = getOne(new LambdaQueryWrapper<Order>().eq(Order::getId, orderId).eq(Order::getBuyerId, uid));
        if (order == null) {
            throw new ApiException("订单不存在");
        }
        if (order.getStatus() != OrderConstants.ORDER_UNPAID) {
            throw new ApiException("订单状态错误");
        }
        // 设置订单状态
        order.setStatus(OrderConstants.ORDER_PAID);
        // 更新订单状态
        updateById(order);

        // 发送通知
        sellerNoticeProducer.produce(new SellerNotice(order.getSeller(), "您有新的订单 订单id为:[" + orderId + "]"));
    }


    /**
     * 取消订单
     */
    @Override
    public void cancelOrder(Long uid, Long orderId) {
        Order order = getOne(new LambdaQueryWrapper<Order>().eq(Order::getId, orderId).eq(Order::getBuyerId, uid));
        if (order == null) {
            throw new ApiException("订单不存在");
        }
        if (order.getStatus() != OrderConstants.ORDER_UNPAID) {
            throw new ApiException("订单状态错误");
        }
        // 设置订单状态
        order.setStatus(OrderConstants.ORDER_CANCEL);
        // 更新订单状态
        updateById(order);
    }

    @Override
    public PageResult<OrderGoodsVO> getSellerOrderList(Long id, PageParamDTO params) {
        // 分页查询
        Page<Order> page = page(new Page<>(params.getStart(), params.getPageSize())
                , new LambdaQueryWrapper<Order>()
                        .eq(Order::getSeller, id)
                        .select(Order::getId, Order::getSeller));
        List<OrderGoodsVO> orderGoodsList = new ArrayList<>();
        // 查询对应商品列表
        page.getRecords().forEach(e -> {
            OrderGoodsVO orderGoodsVO = new OrderGoodsVO();
            BeanUtils.copyProperties(e, orderGoodsVO);
            orderGoodsVO.setGoodsList(orderGoodsMapper.selectList(
                    new LambdaQueryWrapper<OrderGoods>()
                            .eq(OrderGoods::getOrderId, e.getId())));
            orderGoodsList.add(orderGoodsVO);
        });
        return new PageResult<>(orderGoodsList, page.getTotal(), page.getSize());
    }

    @Override
    public void deliverGoods(Long uid, Long orderId) {
        Order order = getOne(new LambdaQueryWrapper<Order>().eq(Order::getId, orderId).eq(Order::getSeller, uid));
        if (order == null) {
            throw new ApiException("订单不存在");
        }
        if (order.getStatus() != OrderConstants.ORDER_PAID) {
            throw new ApiException("订单状态错误");
        }
        // 设置订单状态
        order.setStatus(OrderConstants.ORDER_DELIVERED);
        // 更新订单状态
        updateById(order);
        buyerNoticeProducer.produce(new BuyerNotice(order.getBuyerId(), "您的订单[" + orderId + "]已发货，请注意查收"));
    }


}
