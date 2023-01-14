package org.gdufs.shop.producer;

import org.gdufs.shop.constants.RedisPrefix;
import org.gdufs.shop.entity.BuyerNotice;
import org.gdufs.shop.entity.SellerNotice;
import org.gdufs.shop.utils.RedisUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

/**
 * Description:
 * Param:
 * return:
 * Author: wzf
 * Date: 2022/12/28
 */
@Component
public class BuyerNoticeProducer {
    private static final String MESSAGE_KEY = RedisPrefix.BUYER_MESSAGE_QUEUE;

    @Autowired
    RedisUtils redisUtils;

    // 放入待处理消息
    @Async("taskExecutor")
    public void produce(BuyerNotice buyerNotice) {
        redisUtils.lPush(MESSAGE_KEY, buyerNotice);
    }
}
