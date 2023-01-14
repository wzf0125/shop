package org.gdufs.shop.mapper;

import org.gdufs.shop.entity.Order;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.gdufs.shop.vo.OrderGoodsVO;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author wzf
 * @since 2022-12-12
 */
@Mapper
public interface OrderMapper extends BaseMapper<Order> {

}
