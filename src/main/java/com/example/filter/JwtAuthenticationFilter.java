package com.example.filter;

import cn.hutool.core.util.StrUtil;
import com.example.common.security.UserSecurityServiceImpl;
import com.example.entity.User;
import com.example.utils.JwtUtils;
import com.example.utils.RedisUtils;
import com.example.utils.Result;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.annotation.Resource;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

/**
 * JWT过滤器JwtAuthenticationFilter，当前端发来的请求有JWT信息时，
 * 该过滤器将检验JWT是否正确以及是否过期，若检验成功，则获取JWT中的用户名信息，
 * 检索数据库获得用户实体类，并将用户信息告知Spring Security，
 * 后续我们就能调用security的接口获取到当前登录的用户信息。
 */
@Component
public class JwtAuthenticationFilter extends OncePerRequestFilter {

    @Autowired
    JwtUtils jwtUtils;
    @Autowired
    ObjectMapper objectMapper;
    @Autowired
    UserSecurityServiceImpl userDetailService;
    @Autowired
    RedisUtils redisUtils;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws IOException, ServletException {
        String jwt = request.getHeader(jwtUtils.getHeader());
        // 这里如果没有jwt，继续往后走，因为后面还有鉴权管理器等去判断是否拥有身份凭证，所以是可以放行的
        // 没有jwt相当于匿名访问，若有一些接口是需要权限的，则不能访问这些接口
        if (StrUtil.isBlankOrUndefined(jwt)) {
            chain.doFilter(request, response);
            return;
        }

        Claims claim = jwtUtils.getClaimsByToken(jwt);
        if (claim == null) {
            throw new JwtException("token 异常");
        }
        if (jwtUtils.isTokenExpired(claim)) {
            throw new JwtException("token 已过期");
        }

        //从redis中获取token,判断是否存在
        String tokenInRedis = redisUtils.getCacheObject("logintoken:" + jwt);
        if (!StringUtils.hasText(tokenInRedis)) {
            Result result = Result.fail("用户已退出，请重新登录");
            return;
        }
        //用户基本信息
        String userInfo = (String) claim.get("userInfo");
        //反序列化：将字符串转为User对象
        User user = objectMapper.readValue(userInfo, User.class);
        // 获取用户的权限等信息
        List<String> userAuth = (List<String>) claim.get("userAuth");

        List<SimpleGrantedAuthority> userPermissions = userAuth.stream().map(SimpleGrantedAuthority::new).collect(Collectors.toList());

        // 构建UsernamePasswordAuthenticationToken,这里密码为null，是因为提供了正确的JWT,实现自动登录
        UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(user, null, userPermissions);
        //把token放到安全上下文中,securityContext
        SecurityContextHolder.getContext().setAuthentication(token);

        chain.doFilter(request, response);

    }
}
