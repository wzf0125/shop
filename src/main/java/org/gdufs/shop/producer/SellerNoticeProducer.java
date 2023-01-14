package org.gdufs.shop.producer;

import org.gdufs.shop.constants.RedisPrefix;
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
public class SellerNoticeProducer {
    private static final String MESSAGE_KEY = RedisPrefix.SELLER_MESSAGE_QUEUE;

    @Autowired
    RedisUtils redisUtils;

    // 放入待处理消息
    @Async("taskExecutor")
    public void produce(SellerNotice sellerNotice) {
        redisUtils.lPush(MESSAGE_KEY, sellerNotice);
    }
}
