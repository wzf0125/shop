package org.gdufs.shop.consumer;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.gdufs.shop.constants.RedisPrefix;
import org.gdufs.shop.entity.BuyerNotice;
import org.gdufs.shop.entity.SellerNotice;
import org.gdufs.shop.service.BuyerNoticeService;
import org.gdufs.shop.service.SellerNoticeService;
import org.gdufs.shop.utils.RedisUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * Description:
 * Param:
 * return:
 * Author: wzf
 * Date: 2022/12/28
 */
@Slf4j
@Component
@EnableScheduling
public class SellerNoticeConsumer {
    private static final String MESSAGE_KEY = RedisPrefix.SELLER_MESSAGE_QUEUE;

    @Autowired
    RedisUtils redisUtils;
    @Autowired
    SellerNoticeService sellerNoticeService;

    @Async("taskExecutor")
    public void consume() {
        SellerNotice sellerNotice = (SellerNotice) redisUtils.rPop(MESSAGE_KEY);
        if (sellerNotice != null) {
            sellerNoticeService.save(sellerNotice);
            log.info("卖家消息消费到1条信息: {}",sellerNotice);
        }
    }
}
