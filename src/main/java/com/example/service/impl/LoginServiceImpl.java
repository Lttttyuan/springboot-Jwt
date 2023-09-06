package com.example.service.impl;

import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.ShearCaptcha;
import com.example.utils.RedisUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.awt.*;
import java.util.concurrent.TimeUnit;

@Service
public class LoginServiceImpl {
    @Autowired
    private RedisUtils redisUtil;
    /**
     * 获取验证码Base64
     *
     * @param randomCode
     * @return
     */
    public String getRandomCode(String randomCode) {
        //定义图形验证码的长、宽、验证码字符数、干扰元素个数
        ShearCaptcha captcha = CaptchaUtil.createShearCaptcha(90, 34, 4, 3);
        //设置背景颜色
        captcha.setBackground(Color.WHITE);
        //验证图形验证码的有效性，返回boolean值
        captcha.verify("60");
        //将字符长存入redis，并判断redis中是否存在

        //TimeUnit是个枚举类，我这里选择是以秒计时，如60秒后过期清除当前验证码
//        boolean redisCode = RedisUtil.set("code_" + randomCode, captcha.getCode(), 过期时长, TimeUnit.SECONDS);
        redisUtil.setCacheObject("code_" + randomCode, captcha.getCode(), 60, TimeUnit.SECONDS);
        //如果存入redis中失败，抛出异常
        //这里是自定义异常类，可以自行处理，不影响
//        if (!redisCode) {
//            new BusinessException(状态码, 返回提示信息);
//        }
        //3.这里只返回Base64字符串用来展示
        return captcha.getImageBase64();
    }

}
