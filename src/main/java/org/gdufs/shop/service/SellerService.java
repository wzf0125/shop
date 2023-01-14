package org.gdufs.shop.service;

import org.gdufs.shop.dto.LoginDTO;
import org.gdufs.shop.dto.RegisterDTO;
import org.gdufs.shop.entity.Seller;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author wzf
 * @since 2022-12-12
 */
public interface SellerService extends IService<Seller> {
    // 登录
    public String login(LoginDTO param);
    // 注册
    void register(RegisterDTO param);
}
