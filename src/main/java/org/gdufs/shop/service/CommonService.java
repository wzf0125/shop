package org.gdufs.shop.service;

/**
 * Description:
 * Param:
 * return:
 * Author: wzf
 * Date: 2022/12/19
 */
public interface CommonService {
    // 发送邮件
    public void sendEmailCode(String email,String type);
}
