package com.example.handler;

import cn.hutool.json.JSONUtil;
import com.example.utils.JwtUtils;
import com.example.utils.RedisUtils;
import com.example.utils.Result;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;

/**
 * 登出处理器LogoutSuccessHandler
 * 在用户退出登录时，我们需将原来的JWT置为空返给前端，这样前端会将空字符串覆盖之前的jwt，
 * JWT是无状态化的，销毁JWT是做不到的，JWT生成之后，只有等JWT过期之后，才会失效。因此我们采取置空策略来清除浏览器中保存的JWT。
 * 同时我们还要将我们之前置入SecurityContext中的用户信息进行清除，这可以通过创建SecurityContextLogoutHandler对象，调用它的logout方法完成
 */
@Component
public class JWTLogoutSuccessHandler implements LogoutSuccessHandler {

    @Autowired
    JwtUtils jwtUtils;
    @Autowired
    RedisUtils redisUtils;
    @Value("${my.token.header}")
    private String header;

    @Override
    public void onLogoutSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException {
        //从请求头中获取Authorization信息
        String authorization = httpServletRequest.getHeader(header);
        //如果授权信息为空，返回前端
        if (null == authorization) {
            httpServletResponse.setContentType("application/json;charset=UTF-8");
            ServletOutputStream outputStream = httpServletResponse.getOutputStream();

            Result result = Result.fail("token不能为空");

            outputStream.write(JSONUtil.toJsonStr(result).getBytes(StandardCharsets.UTF_8));
            outputStream.flush();
            outputStream.close();
            return;
        }
        //如果Authorization信息不为空，去掉头部的Bearer字符串
        String token = authorization.replace("Bearer ", "");
        //redis中删除token，这是关键点
        redisUtils.deleteObject("logintoken:" + token);
        httpServletResponse.setContentType("application/json;charset=UTF-8");
        ServletOutputStream outputStream = httpServletResponse.getOutputStream();

        Result result = Result.succ("退出成功");

        outputStream.write(JSONUtil.toJsonStr(result).getBytes(StandardCharsets.UTF_8));
        outputStream.flush();
        outputStream.close();
    }
}
