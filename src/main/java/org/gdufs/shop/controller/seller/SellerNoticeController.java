package org.gdufs.shop.controller.seller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.gdufs.shop.bean.JsonResponse;
import org.gdufs.shop.constants.Roles;
import org.gdufs.shop.controller.BaseController;
import org.gdufs.shop.dto.PageParamDTO;
import org.gdufs.shop.entity.BuyerNotice;
import org.gdufs.shop.entity.SellerNotice;
import org.gdufs.shop.interceptor.RequiredPermission;
import org.gdufs.shop.service.SellerNoticeService;
import org.gdufs.shop.utils.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Description:
 * Param:
 * return:
 * Author: wzf
 * Date: 2022/12/12
 */
@RestController
@RequiredPermission({Roles.SELLER})
@RequestMapping("/seller/notice")
public class SellerNoticeController extends BaseController {
    @Autowired
    SellerNoticeService sellerNoticeService;

    /**
     * [S011]获取消息
     * GET /seller/notice
     * 接口ID：54174246
     * 接口地址：https://www.apifox.cn/web/project/2067016/apis/api-54174246
     */
    @GetMapping
    public JsonResponse<Object> getNotice(@Validated PageParamDTO params) {
        Page<SellerNotice> page = sellerNoticeService.page(new Page<>(params.getStart(), params.getPageSize()),
                new LambdaQueryWrapper<SellerNotice>()
                        .eq(SellerNotice::getSellerId, getUid()).orderByDesc(SellerNotice::getSellerId));
        return JsonResponse.success(new PageResult<>(page.getRecords(), page.getTotal(), page.getSize()));
    }

}
