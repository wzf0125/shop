package org.gdufs.shop.service.serviceImpl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.gdufs.shop.constants.RedisPrefix;
import org.gdufs.shop.dto.AddGoods2CarDTO;
import org.gdufs.shop.dto.AddGoodsDTO;
import org.gdufs.shop.dto.EditGoodsDTO;
import org.gdufs.shop.dto.PageParamDTO;
import org.gdufs.shop.entity.Goods;
import org.gdufs.shop.entity.Order;
import org.gdufs.shop.exception.ApiException;
import org.gdufs.shop.mapper.GoodsMapper;
import org.gdufs.shop.service.GoodsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.gdufs.shop.utils.ExpireUtils;
import org.gdufs.shop.utils.PageResult;
import org.gdufs.shop.utils.RedisUtils;
import org.gdufs.shop.vo.CarVO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.ZSetOperations;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
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
public class GoodsServiceImpl extends ServiceImpl<GoodsMapper, Goods> implements GoodsService {
    @Autowired
    RedisUtils redisUtils;
    @Autowired
    GoodsMapper goodsMapper;

    /**
     * 获取商品列表
     */
    @Override
    public PageResult<Goods> getSellerGoodsList(Long sellerId, PageParamDTO param) {
        Page<Goods> page = goodsMapper.selectPage(
                new Page<>(param.getStart(), param.getCurrentPage()),
                new LambdaQueryWrapper<Goods>()
                        .eq(Goods::getSellerId, sellerId));
        return new PageResult<>(page.getRecords(), page.getTotal(), page.getSize());
    }

    @Override
    public PageResult<Goods> getGoodsList(PageParamDTO param) {
        Page<Goods> page = goodsMapper.selectPage(
                new Page<>(param.getStart(), param.getPageSize()), null
        );
        return new PageResult<>(page.getRecords(), page.getTotal(), page.getSize());
    }

    /**
     * 添加商品
     */
    @Override
    public void addGoods(Long sellerId, AddGoodsDTO params) {
        Goods goods = new Goods();
        BeanUtils.copyProperties(params, goods);
        goods.setSellerId(sellerId);
        // 插入商品
        save(goods);
        // 设置商品信息缓存
        saveGoodsInfo(goods);
        // 设置商品库存缓存
        redisUtils.set(String.format(RedisPrefix.GOODS_STOCK_PREFIX, goods.getId()), goods.getStock());
    }

    @Override
    public Goods getGoodsInfo(Long id) {
        Goods goods = (Goods) redisUtils.get(String.format(RedisPrefix.GOODS_CACHE_PREFIX, id));
        if (goods == null) {
            // 缓存失效则进行查询
            goods = getById(id);
            if (goods == null) {
                throw new ApiException("商品不存在");
            }
            // 保存缓存信息
            saveGoodsInfo(goods);
        }
        // 同步库存信息
        goods.setStock(getGoodsStock(id));
        return goods;
    }

    /**
     * 保存商品信息
     */
    private void saveGoodsInfo(Goods goods) {
        // 设置商品信息缓存
        redisUtils.set(String.format(RedisPrefix.GOODS_CACHE_PREFIX, goods.getId()), goods, ExpireUtils.getRandExpire(60 * 60 * 24L));
    }

    /**
     * 获取商品库存
     */
    private int getGoodsStock(Long id) {
        return redisUtils.getIntOrZero(String.format(RedisPrefix.GOODS_STOCK_PREFIX, id));
    }

    /**
     * 编辑商品
     */
    @Override
    @Transactional
    public void editGoods(EditGoodsDTO params) {
        // 编辑商品信息
        Goods goods = getById(params.getId());
        if (goods == null) {
            throw new ApiException("商品不存在");
        }
        // 复制要修改的数据
        BeanUtils.copyProperties(params, goods);
        goods.setStock(goods.getStock() + params.getAddStock());
        goodsMapper.updateById(goods);
        // 更新缓存
        saveGoodsInfo(goods);
        // 增加库存
        redisUtils.incr(String.format(RedisPrefix.GOODS_STOCK_PREFIX, params.getId()), params.getAddStock());
    }

    /**
     * 删除商品
     */
    @Override
    @Transactional
    public void deleteGoods(Long id) {
        // 删除课程
        int i = goodsMapper.deleteById(id);
        if (i != 1) {
            throw new ApiException("删除商品失败");
        }
        redisUtils.del(String.format(RedisPrefix.GOODS_CACHE_PREFIX, id));
    }

    /**
     * 添加商品到购物车
     */
    @Override
    public void addGoods2Car(long uid, AddGoods2CarDTO param) {
        // 先校验商品当前库存是否足够
        if (getGoodsStock(param.getGoodsId()) < param.getQuantity()) {
            throw new ApiException("商品库存不足");
        }
        // 保存至购物车
        String key = String.format(RedisPrefix.BUYER_CAR_PREFIX, uid);
        redisUtils.zIncr(key, param.getGoodsId(), param.getQuantity());
    }

    /**
     * 移除购物车商品
     */
    @Override
    public void removeCarGoods(long uid, long goodIs) {
        String key = String.format(RedisPrefix.BUYER_CAR_PREFIX, uid);
        redisUtils.zRemove(key, goodIs);
    }

    @Override
    public List<CarVO> getGarGoodsList(long uid) {
        String key = String.format(RedisPrefix.BUYER_CAR_PREFIX, uid);
        // 获取购物车信息
        Set<ZSetOperations.TypedTuple<Object>> typedTuples = redisUtils.zGetSetAll(key);
        // 将信息转换为map 方便后续取值
        List<Object> goodsIdList = typedTuples.stream().map(ZSetOperations.TypedTuple::getValue).collect(Collectors.toList());
        if (goodsIdList.isEmpty()) {
            throw new ApiException("购物车为空");
        }
        Map<Object, Object> goodsMap = typedTuples.stream().collect(Collectors.toMap(ZSetOperations.TypedTuple::getValue, ZSetOperations.TypedTuple::getScore));
        System.out.println(goodsMap);
        List<Goods> goods = goodsMapper.selectList(new LambdaQueryWrapper<Goods>().in(Goods::getId, goodsIdList));
        List<CarVO> carVOList = new ArrayList<>();
        goods.forEach(e -> {
            CarVO carVO = new CarVO();
            BeanUtils.copyProperties(e, carVO);
            carVO.setQuantity(((Double) goodsMap.get(e.getId())).longValue());
            carVO.setStock(getGoodsStock(e.getId()));
            carVOList.add(carVO);
        });
        return carVOList;
    }

    @Override
    public List<Goods> getGoodsOderByPurchase(PageParamDTO params) {
        Set<Object> ids = redisUtils.zRange(RedisPrefix.GOODS_PURCHASE_RANK, params.getStart(), params.getStart() + params.getPageSize());
        if (ids.isEmpty()) {
            return new ArrayList<>();
        }
        return getGoodsByIds(ids);
    }

    @Override
    public List<Goods> getGoodsOderByView(PageParamDTO params) {
        Set<Object> ids = redisUtils.zRange(RedisPrefix.GOODS_VISIT_RANK, params.getStart(), params.getStart() + params.getPageSize());
        if (ids.isEmpty()) {
            return new ArrayList<>();
        }
        return getGoodsByIds(ids);
    }

    private List<Goods> getGoodsByIds(Set<Object> ids) {
        return list(new LambdaQueryWrapper<Goods>().in(Goods::getId, ids));
    }
}
