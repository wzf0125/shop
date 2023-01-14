package org.gdufs.shop.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.*;
import org.gdufs.shop.constants.SysDefaultValue;

/**
 * <p>
 *
 * </p>
 *
 * @author wzf
 * @since 2022-12-12
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("seller")
public class Seller implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * pk_id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 店铺名称
     */
    @TableField("name")
    private String name;

    /**
     * 邮箱
     */
    @TableField("email")
    private String email;

    /**
     * 密码
     */
    @TableField("password")
    private String password;

    /**
     * 密码盐值
     */
    @TableField("salt")
    private String salt;

    /**
     * 逻辑删除(1为已删除 默认为0)
     */
    @TableLogic
    private Integer isDeleted;

    public Seller(String name, String email, String password, String salt) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.salt = salt;
    }

    public Seller(String email, String password, String salt) {
        this.email = email;
        this.password = password;
        this.salt = salt;
        this.name = SysDefaultValue.DEFAULT_USERNAME;
    }
}
