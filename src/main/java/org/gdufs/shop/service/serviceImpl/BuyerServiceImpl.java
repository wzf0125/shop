package org.gdufs.shop.service.serviceImpl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.gdufs.shop.constants.RedisPrefix;
import org.gdufs.shop.constants.Roles;
import org.gdufs.shop.dto.LoginDTO;
import org.gdufs.shop.dto.RegisterDTO;
import org.gdufs.shop.entity.Buyer;
import org.gdufs.shop.exception.ApiException;
import org.gdufs.shop.mapper.BuyerMapper;
import org.gdufs.shop.service.BuyerService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.gdufs.shop.utils.MD5Utils;
import org.gdufs.shop.utils.RedisUtils;
import org.gdufs.shop.utils.TokenUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author wzf
 * @since 2022-12-12
 */
@Service
public class BuyerServiceImpl extends ServiceImpl<BuyerMapper, Buyer> implements BuyerService {
    @Autowired
    BuyerMapper buyerMapper;
    @Autowired
    TokenUtils tokenUtils;
    @Autowired
    RedisUtils redisUtils;

    @Override
    public String login(LoginDTO param) {
        Buyer buyer = buyerMapper.selectOne(
                new LambdaQueryWrapper<Buyer>()
                        .eq(Buyer::getEmail, param.getEmail())
        );
        if (buyer == null) {
            throw new ApiException("用户不存在 ");
        }
        if (!MD5Utils.compare(param.getPassword(), buyer.getSalt(), buyer.getPassword())) {
            throw new ApiException("密码错误");
        }
        return tokenUtils.grantToken(buyer.getId(), Roles.BUYER);
    }

    @Override
    public void register(RegisterDTO param) {
        // 先判断邮箱是否已存在
        Buyer buyer = buyerMapper.selectOne(new LambdaQueryWrapper<Buyer>().eq(Buyer::getEmail, param.getMail()));
        if (buyer != null) {
            throw new ApiException("邮箱已被注册");
        }

        // 先校验code是否正确
        String code = (String) redisUtils.get(String.format(RedisPrefix.BUYER_VERIFICATION_EMAIL_PREFIX, param.getMail()));
        if (code == null || !code.equals(param.getCode())) {
            throw new ApiException("验证码错误");
        }
        String salt = MD5Utils.getSalt();
        String password = MD5Utils.md5(param.getPassword(), salt);
        buyer = new Buyer(param.getMail(), password, salt);
        int insert = buyerMapper.insert(buyer);
        if (insert != 1) {
            throw new ApiException("注册失败");
        }
        // 删除code缓存
        redisUtils.del(String.format(RedisPrefix.BUYER_VERIFICATION_EMAIL_PREFIX, param.getMail()));
    }
}
