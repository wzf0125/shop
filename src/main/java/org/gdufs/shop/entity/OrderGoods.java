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
@TableName("order_goods")
public class OrderGoods implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * pk_id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 订单id
     */
    @TableField("order_id")
    private Long orderId;

    /**
     * 商品id
     */
    @TableField("goods_id")
    private Long goodsId;

    /**
     * 购买数量
     */
    @TableField("quantity")
    private Long quantity;

    /**
     * 逻辑删除(1为已删除 默认为0)
     */
    @TableLogic
    private Integer isDeleted;

    public OrderGoods(Long orderId, Long goodsId, Long quantity) {
        this.orderId = orderId;
        this.goodsId = goodsId;
        this.quantity = quantity;
    }
}
