package org.gdufs.shop.utils;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * Description:
 * Param:
 * return:
 * Author: wzf
 * Date: 2022/12/27
 */
@Data
@NoArgsConstructor
public class PageResult<T> {
    List<T> dataList; // 数据
    Integer page; // 页面数量
    Long total; // 数据总数


    public PageResult(List<T> dataList, Long total, Long pageSize) {
        this.dataList = dataList;
        this.total = total;
        this.page = (int)(total / pageSize)+1;
    }
}
