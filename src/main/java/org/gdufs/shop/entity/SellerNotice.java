package org.gdufs.shop.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.*;

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
@TableName("seller_notice")
public class SellerNotice implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * pk_id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 用户id
     */
    @TableField("seller_id")
    private Long sellerId;

    /**
     * 通知
     */
    @TableField("message")
    private String message;

    /**
     * 逻辑删除(1为已删除 默认为0)
     */
    @TableLogic
    private Integer isDeleted;

    public SellerNotice(Long sellerId, String message) {
        this.sellerId = sellerId;
        this.message = message;
    }
}
