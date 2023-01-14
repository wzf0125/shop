package org.gdufs.shop;

import org.gdufs.shop.dto.AddGoods2CarDTO;
import org.gdufs.shop.service.GoodsService;
import org.gdufs.shop.service.OrderService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;

import java.util.Random;

/**
 * Description:
 * Param:
 * return:
 * Author: wzf
 * Date: 2022/12/30
 */
@SpringBootTest(classes = ShopApplication.class)
@ActiveProfiles("dev")
@ContextConfiguration
public class TestCar {
    @Autowired
    OrderService orderService;
    @Autowired
    GoodsService goodsService;

    @Test
    public void addGoodsToCar() {
        Long goodsId = 9L;
        int start = 1;
        int end = 10;
        // 测试账号id为 107 - 206
        for (int i = 107; i <= 206; i++) {
            AddGoods2CarDTO param = new AddGoods2CarDTO();
            param.setGoodsId(goodsId);
            param.setQuantity((long) (Math.random() * (end - start + 1) + start));
            goodsService.addGoods2Car(i, param);
        }
    }


    @Test
    public void settlementCar(){
        for (int i = 107; i <= 206; i++) {
            int finalI = i;
            // 进行多线程秒杀
            new Thread(() -> {
                orderService.addUnpaidOrder(finalI);
            }).start();
        }
    }
}
