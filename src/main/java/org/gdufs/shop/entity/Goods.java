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
@TableName("goods")
public class Goods implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * pk_id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 商品名称
     */
    @TableField("name")
    private String name;

    /**
     * 店铺id
     */
    @TableField("seller_id")
    private Long sellerId;

    /**
     * 商品简介
     */
    @TableField("`describe`")
    private String describe;

    /**
     * 库存
     */
    @TableField("stock")
    private Integer stock;

    /**
     * 逻辑删除(1为已删除 默认为0)
     */
    @TableField("is_deleted")
    private Integer isDeleted;

}
