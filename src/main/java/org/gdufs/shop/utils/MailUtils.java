package org.gdufs.shop.utils;

import org.gdufs.shop.exception.ApiException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

import javax.mail.internet.MimeMessage;

/**
 * @description 发送邮件工具类
 * @author quanta
 */
@Component
public class MailUtils {
    final
    JavaMailSender javaMailSender;

    @Value("${spring.mail.username}")
    private String mailFrom;
    @Value("${hostAddress}")
    private String hostAddress;

    public MailUtils(JavaMailSender javaMailSender) {
        this.javaMailSender = javaMailSender;
    }

    /**
     * 发送邮件基础方法
     * @param recipients 收件人数组
     * @param title 邮件标题
     * @param content 邮件正文
     * @param isHtml 是否html格式
     */
    private void sendMail(String[] recipients, String title, String content, boolean isHtml) {
        MimeMessage mimeMailMessage = javaMailSender.createMimeMessage();
        try {
            MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMailMessage, true, "utf-8");
            messageHelper.setFrom(mailFrom, "[简易商城]");
            messageHelper.setTo(recipients);
            messageHelper.setSubject(title);
            messageHelper.setText(content, isHtml);
            javaMailSender.send(mimeMailMessage);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ApiException("邮件发送出错！");
        }
    }

    /**
     * 生成邮箱验证码，码长6位，字母与数字混合
     * @return 6位验证码
     */
    public String getVerificationCode() {
        // 增大数字权重，去除部分相似字母
        final String CHARACTERS = "0123456789012345678901234567890123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ";
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < 6; i++) {
            sb.append(CHARACTERS.charAt((int) (Math.random() * (CHARACTERS.length()))));
        }
        return sb.toString();
    }

    // 异步发送验证码
    @Async("taskExecutor")
    public void sendVerificationCode(String recipient, String code) {
        String title = "[简易商城]邮箱验证";
        String template = "您正在注册简易商城，请填写验证码 %s 注册账号(5分钟内有效)";
        String content = String.format(template, code);
        this.sendMail(new String[]{recipient}, title, content, true);
    }
}
