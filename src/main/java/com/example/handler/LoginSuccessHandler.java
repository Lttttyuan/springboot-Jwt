package com.example.handler;

import cn.hutool.json.JSONUtil;
import com.example.common.security.UserSecurity;
import com.example.entity.User;
import com.example.utils.JwtUtils;
import com.example.utils.RedisUtils;
import com.example.utils.Result;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Collection;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

@Component
public class LoginSuccessHandler implements AuthenticationSuccessHandler {
    @Autowired
    JwtUtils jwtUtils;
    @Autowired
    ObjectMapper objectMapper;
    @Autowired
    RedisUtils redisUtils;
    @Value("${my.token.expire}")
    private Integer expire; //7天，s为单位

    @Override
    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException {
        httpServletResponse.setContentType("application/json;charset=UTF-8");
        ServletOutputStream outputStream = httpServletResponse.getOutputStream();

        //从认证信息中获取登录用户信息
        UserSecurity userSecurity = (UserSecurity) authentication.getPrincipal();
        User user = userSecurity.getUser();
        //序列化
        String userInfo = objectMapper.writeValueAsString(user);
        //获取权限信息
        List<SimpleGrantedAuthority> authorities = (List<SimpleGrantedAuthority>) userSecurity.getAuthorities();
        List<String> userPermissions = authorities.stream().map(SimpleGrantedAuthority::getAuthority).collect(Collectors.toList());

        // 生成JWT，并放置到请求头中
        String jwt = jwtUtils.generateToken(user.getUsername(), userInfo, userPermissions);
        httpServletResponse.setHeader(jwtUtils.getHeader(), jwt);

        //将jwt放到redis中，设置过期时间和jwt过期时间一致
        redisUtils.setCacheObject("loginToken:" + jwt, objectMapper.writeValueAsString(authentication), expire, TimeUnit.SECONDS);

        Result result = Result.succ(200, "jwt生成成功且放入redis中", jwt);

        outputStream.write(JSONUtil.toJsonStr(result).getBytes(StandardCharsets.UTF_8));
        outputStream.flush();
        outputStream.close();
    }
}
