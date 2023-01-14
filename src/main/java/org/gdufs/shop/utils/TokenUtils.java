package org.gdufs.shop.utils;

import org.gdufs.shop.constants.RedisPrefix;
import org.gdufs.shop.exception.ApiException;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.UUID;

/**
 * @author Quantacenter
 * @description token工具类
 */
@Component
public class TokenUtils {

    private final RedisUtils redisUtils;

    public TokenUtils(RedisUtils redisUtils) {
        this.redisUtils = redisUtils;
    }

    /**
     * 发放token
     *
     * @param uid  用户id
     * @param role 权限
     * @return 获取到的token
     */
    public String grantToken(Long uid, int role) {
        HashMap<String, Object> identity = new HashMap<>();
        identity.put("uid", uid);
        identity.put("role", role);

        String key = UUID.randomUUID().toString().replace("-", "");
        // token有效期为1周
        boolean result = redisUtils.set(key, identity, ExpireUtils.getRandExpire(60 * 60 * 24 * 7L));
        // 删掉之前如果有效的token
        String formerToken = (String) redisUtils.get(String.format(RedisPrefix.getTokenPrefixByRole(role), uid));
        if (formerToken != null) {
            destroyToken(formerToken);
        }
        redisUtils.set(String.format(RedisPrefix.getTokenPrefixByRole(role), uid), key);
        if (result) {
            return key;
        } else {
            throw new ApiException("token 获取错误");
        }
    }

    /**
     * 获取token信息
     *
     * @param key token
     * @return uid和role的map
     */
    @SuppressWarnings("unchecked")
    private HashMap<String, Object> retrieveToken(String key) {
        return (HashMap<String, Object>) redisUtils.get(key);
    }

    /**
     * 获取token对应的权限
     *
     * @param key token
     * @return 权限
     */
    public int getTokenRole(String key) {
        int role;
        try {
            role = (int) retrieveToken(key).get("role");
        } catch (NullPointerException e) {
            throw new ApiException("token无效");
        }
        return role;
    }

    /**
     * 获取token对应的id
     *
     * @param key token
     * @return id
     */
    public Long getTokenUid(String key) {
        return (Long) retrieveToken(key).get("uid");
    }

    /**
     * 删除token
     *
     * @param key 缓存key
     */
    private void destroyToken(String key) {
        redisUtils.del(key);
    }

    /**
     * 刷新token时间
     */
    public void refreshToken(String token, Long uid, int role) {
        Long last = redisUtils.getExpire(token); // 获取token剩余时间
        if (last <= (60 * 60 * 24)) { // 有效期小于一天
            // 更新有效期
            redisUtils.setExpire(token, 60 * 60 * 24 * 7);
            redisUtils.setExpire(String.format(RedisPrefix.getTokenPrefixByRole(role), uid), 60 * 60 * 24 * 7);
        }
    }

    /**
     * 安全退出
     *
     * @param uid uid
     */
    public void safeExit(Long uid, int role) {
        String formerToken = (String) redisUtils.get(String.format(RedisPrefix.getTokenPrefixByRole(role), uid));
        redisUtils.del(String.format(RedisPrefix.getTokenPrefixByRole(role), uid));
        destroyToken(formerToken);
    }
}
