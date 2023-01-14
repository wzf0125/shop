package org.gdufs.shop.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.Min;

/**
 * Description:
 * Param:
 * return:
 * Author: wzf
 * Date: 2022/12/28
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CarVO {
    private Long id;

    /**
     * 商品名称
     */
    private String name;

    /**
     * 商品简介
     */
    private String describe;

    /**
     * 库存
     */
    private Integer stock;

    /**
     * 购物车中的数量
     */
    private Long quantity;

    /**
     * 卖家id
     */
    private Long sellerId;
}
