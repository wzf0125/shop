package org.gdufs.shop.controller.buyer;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.gdufs.shop.bean.JsonResponse;
import org.gdufs.shop.constants.Roles;
import org.gdufs.shop.controller.BaseController;
import org.gdufs.shop.dto.PageParamDTO;
import org.gdufs.shop.entity.BuyerNotice;
import org.gdufs.shop.interceptor.RequiredPermission;
import org.gdufs.shop.service.BuyerNoticeService;
import org.gdufs.shop.utils.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Description:
 * Param:
 * return:
 * Author: wzf
 * Date: 2022/12/12
 */
@RestController
@RequiredPermission({Roles.BUYER})
@RequestMapping("/buyer/notice")
public class BuyerNoticeController extends BaseController {
    @Autowired
    BuyerNoticeService buyerNoticeService;

    /**
     * [B016]获取通知
     * GET /buyer/notice
     * 接口ID：54174231
     * 接口地址：https://www.apifox.cn/web/project/2067016/apis/api-54174231
     */
    @GetMapping
    public JsonResponse<Object> getNotice(@Validated PageParamDTO params) {
        Page<BuyerNotice> page = buyerNoticeService.page(new Page<>(params.getStart(), params.getPageSize()),
                new LambdaQueryWrapper<BuyerNotice>()
                        .eq(BuyerNotice::getBuyerId, getUid()).orderByDesc(BuyerNotice::getId));
        return JsonResponse.success(new PageResult<>(page.getRecords(), page.getTotal(), page.getSize()));
    }

}
