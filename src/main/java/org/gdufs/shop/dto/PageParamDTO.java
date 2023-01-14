package org.gdufs.shop.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

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
public class PageParamDTO {
    @Min(value = 1, message = "当前页最小值为0")
    @NotNull(message = "参数不能为空")
    private Integer currentPage;

    @Max(value = 100, message = "页大小最大为100")
    @NotNull(message = "参数不能为空")
    private Integer pageSize;

    public Integer getStart() {
        return (currentPage - 1) * pageSize;
    }
}
