package org.gdufs.shop.consumer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * Description:
 * Param:
 * return:
 * Author: wzf
 * Date: 2022/12/29
 */
@Component
@EnableScheduling
public class BaseConsumer {
    @Autowired
    BuyerNoticeConsumer buyerNoticeConsumer;
    @Autowired
    SellerNoticeConsumer sellerNoticeConsumer;

    // 首次5秒后执行，后续每隔2秒执行一次
    @Scheduled(initialDelay = 5 * 1000, fixedRate = 2 * 1000)
    public void consumer() {
        buyerNoticeConsumer.consume();
        sellerNoticeConsumer.consume();
    }
}
