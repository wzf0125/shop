package org.gdufs.shop.dto;

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
 * Date: 2022/12/27
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class EditGoodsDTO {
    @Min(value = 1, message = "id格式错误")
    private Long id;

    /**
     * 商品名称
     */
    @Length(min = 2, message = "商品名称过短")
    private String name;

    /**
     * 商品简介
     */
    @Length(min = 2, message = "商品简介过短")
    private String describe;

    /**
     * 增加库存
     */
    @Min(value = 1, message = "库存不能小于1")
    private Integer addStock;
}
