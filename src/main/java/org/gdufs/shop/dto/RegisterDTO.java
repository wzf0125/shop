package org.gdufs.shop.dto;

import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * Description: 注册参数
 * Param:
 * return:
 * Author: wzf
 * Date: 2022/12/19
 */
@Data
public class RegisterDTO {
    @NotNull
    String mail;
    @NotNull
    String code;
    @NotNull
    String password;
}
