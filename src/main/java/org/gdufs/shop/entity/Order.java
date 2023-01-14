package org.gdufs.shop.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.*;
import org.gdufs.shop.constants.OrderConstants;

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
@TableName("`order`")
public class Order implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * pk_id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 买家id
     */
    @TableField("buyer_id")
    private Long buyerId;

    /**
     * 订单状态 -1 为已取消 0 为待支付 1为已支付
     */
    @TableField("status")
    private int status;

    /**
     * 卖家id
     */
    @TableField("seller")
    private Long seller;

    /**
     * 逻辑删除(1为已删除 默认为0)
     */
    @TableLogic
    private Integer isDeleted;

    public Order(Long buyerId, Long seller) {
        this.buyerId = buyerId;
        this.seller = seller;
        this.status = OrderConstants.ORDER_UNPAID;
    }
}
