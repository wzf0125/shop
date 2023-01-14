package org.gdufs.shop.utils;

import javax.validation.constraints.Min;

/**
 * Description: 过期时间工具类 防止雪崩击穿
 * Param:
 * return:
 * Author: wzf
 * Date: 2022/12/27
 */
public class ExpireUtils {
    public static long MINUTE = 60L; // 1分钟
    public static long HOUR = MINUTE * 60L;// 1 小时
    public static long DAY = HOUR * 24L; // 1天

    public static long DEFAULT_END = HOUR;
    public static long DEFAULT_START = MINUTE * 5;

    public static long getRandExpire(long expire, long start, long end) {
        return expire + (long) (Math.random() * (end - start + 1) + start);
    }

    // 默认5分钟 - 1小时 随机过期时间
    public static long getRandExpire(long expire) {
        return getRandExpire(expire, DEFAULT_START, DEFAULT_END);
    }


}
