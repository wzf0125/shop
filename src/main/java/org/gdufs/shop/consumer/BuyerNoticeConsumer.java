package org.gdufs.shop.consumer;

import lombok.extern.slf4j.Slf4j;
import org.gdufs.shop.constants.RedisPrefix;
import org.gdufs.shop.entity.BuyerNotice;
import org.gdufs.shop.service.BuyerNoticeService;
import org.gdufs.shop.utils.RedisUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * Description:
 * Param:
 * return:
 * Author: wzf
 * Date: 2022/12/28
 */
@Slf4j
@Component
public class BuyerNoticeConsumer {
    private static final String MESSAGE_KEY = RedisPrefix.BUYER_MESSAGE_QUEUE;

    @Autowired
    RedisUtils redisUtils;
    @Autowired
    BuyerNoticeService buyerNoticeService;

    @Async("taskExecutor")
    public void consume() {
        BuyerNotice buyerNotice = (BuyerNotice) redisUtils.rPop(MESSAGE_KEY);
        if (buyerNotice != null) {
            buyerNoticeService.save(buyerNotice);
            log.info("买家消息消费者消息1条消息:{} ", buyerNotice);
        }
    }
}
