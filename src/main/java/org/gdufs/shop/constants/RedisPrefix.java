package org.gdufs.shop.constants;

import org.gdufs.shop.exception.ApiException;

/**
 * @author Quantacenter
 * @description 缓存key前缀
 * @date 2021/11/10
 */
public class RedisPrefix {
    private RedisPrefix() {
        throw new IllegalStateException();
    }

    public static final String BUYER_TOKEN_PREFIX = "buyer_user_%s"; // 买家token
    public static final String SELLER_TOKEN_PREFIX = "seller_user_%s"; // 卖家token
    public static final String ADMIN_TOKEN_PREFIX = "admin_user_%s"; // 管理员token
    public static final String VERIFICATION_CODE_PREFIX = "verification_code_%s"; // 验证码
    public static final String BUYER_VERIFICATION_EMAIL_PREFIX = "buyer_verification_email_%s"; // 验证码邮箱
    public static final String SELLER_VERIFICATION_EMAIL_PREFIX = "seller_verification_email_%s"; // 验证码邮箱
    public static final String GOODS_CACHE_PREFIX = "goods_%s";
    public static final String GOODS_STOCK_PREFIX = "goods_capacity_%s";
    public static final String GOODS_VISIT_RANK = "goods_visit_rank";
    public static final String BUYER_CAR_PREFIX = "buyer_car_%s";
    public static final String BUYER_MESSAGE_QUEUE = "buyer_message_queue";
    public static final String SELLER_MESSAGE_QUEUE = "seller_message_queue";
    public static final String BUYER_ADD_ORDER_LOCK_PREFIX = "buyer_add_order_lock_%s";
    public static final String GOODS_PURCHASE_RANK = "goods_purchase_rank";

    public static String getTokenPrefixByRole(int role) {
        switch (role) {
            case Roles.BUYER:
                return BUYER_TOKEN_PREFIX;
            case Roles.SELLER:
                return SELLER_TOKEN_PREFIX;
            case Roles.ADMIN:
                return ADMIN_TOKEN_PREFIX;
            default:
                throw new ApiException("权限错误");
        }
    }
}
