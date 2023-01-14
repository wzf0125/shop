package org.gdufs.shop.service.serviceImpl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.gdufs.shop.constants.RedisPrefix;
import org.gdufs.shop.entity.Buyer;
import org.gdufs.shop.entity.Seller;
import org.gdufs.shop.exception.ApiException;
import org.gdufs.shop.mapper.BuyerMapper;
import org.gdufs.shop.mapper.SellerMapper;
import org.gdufs.shop.service.CommonService;
import org.gdufs.shop.utils.MailUtils;
import org.gdufs.shop.utils.RedisUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Description:
 * Param:
 * return:
 * Author: wzf
 * Date: 2022/12/19
 */
@Service
public class CommonServiceImpl implements CommonService {
    @Autowired
    RedisUtils redisUtils;
    @Autowired
    MailUtils mailUtils;
    @Autowired
    BuyerMapper buyerMapper;
    @Autowired
    SellerMapper sellerMapper;

    /**
     * 发送邮件
     */
    @Override
    public void sendEmailCode(String mail, String type) {
        String prefix;
        // 判断账号是否已被注册
        if (type.equals("buyer")) {
            Buyer buyer = buyerMapper.selectOne(new LambdaQueryWrapper<Buyer>().eq(Buyer::getEmail, mail));
            if (buyer != null) {
                throw new ApiException("邮箱已被注册");
            }
            prefix = RedisPrefix.BUYER_VERIFICATION_EMAIL_PREFIX;
        } else {
            Seller seller = sellerMapper.selectOne(new LambdaQueryWrapper<Seller>().eq(Seller::getEmail, mail));
            if (seller != null) {
                throw new ApiException("邮箱已被注册");
            }
            prefix = RedisPrefix.SELLER_VERIFICATION_EMAIL_PREFIX;
        }

        // 验证码
        String code = mailUtils.getVerificationCode();
        // 验证码储存至redis(5分钟有效)
        redisUtils.set(String.format(prefix, mail), code, 5 * 60);
        // 发送邮件(异步)
        mailUtils.sendVerificationCode(mail, code);
    }
}
