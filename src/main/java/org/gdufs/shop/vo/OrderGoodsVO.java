package org.gdufs.shop.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.gdufs.shop.entity.Goods;
import org.gdufs.shop.entity.OrderGoods;

import java.util.List;

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
public class OrderGoodsVO {
    private Long id;

    private Long seller;

    private List<OrderGoods> goodsList;
}
