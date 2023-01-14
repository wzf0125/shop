package org.gdufs.shop.dto;

import lombok.Data;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

/**
 * Description:
 * Param:
 * return:
 * Author: wzf
 * Date: 2022/12/28
 */
@Data
public class AddGoods2CarDTO {
    @NotNull(message = "商品id不能为空")
    @Min(value = 1, message = "商品id不能小于1")
    private Long goodsId;
    @NotNull(message = "商品数量不能为空")
    @Min(value = 1, message = "商品数量不能小于1")
    private Long quantity;
}
