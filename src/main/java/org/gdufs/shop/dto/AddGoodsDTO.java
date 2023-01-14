package org.gdufs.shop.dto;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

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
public class AddGoodsDTO {

    /**
     * 商品名称
     */
    @Length(min = 2, message = "商品名称过短")
    @NotNull(message = "参数不能为空")
    private String name;

    /**
     * 商品简介
     */
    @Length(min = 2, message = "商品简介过短")
    @NotNull(message = "参数不能为空")
    private String describe;

    /**
     * 库存
     */
    @Min(value = 1, message = "库存不能小于1")
    @NotNull(message = "参数不能为空")
    private Integer stock;
}
