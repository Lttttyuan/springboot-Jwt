package com.example.config;

import com.example.filter.JwtAuthenticationEntryPoint;
import com.example.filter.JwtAuthenticationFilter;
import com.example.handler.JWTLogoutSuccessHandler;
import com.example.handler.JwtAccessDeniedHandler;
import com.example.handler.LoginFailureHandler;
import com.example.handler.LoginSuccessHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private LoginSuccessHandler loginSuccessHandler; //登录认证成功处理器
    @Autowired
    private LoginFailureHandler loginFailureHandler; //登录认证失败处理器
    @Autowired
    private JWTLogoutSuccessHandler jwtLogoutSuccessHandler; //登出处理器
    @Autowired
    private JwtAuthenticationFilter jwtAuthenticationFilter; //jwt认证过滤器
    @Autowired
    private JwtAuthenticationEntryPoint jwtAuthenticationEntryPoint;//jwt认证失败处理器
    @Autowired
    private JwtAccessDeniedHandler jwtAccessDeniedHandler; //无法访问处理器

    //放行资源路径
    private static final String[] URL_WHITELIST = {
            "/login",
            "/logout",
            "/favicon.ico"
    };

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    /*
     * 解决Security访问Swagger2被拦截的问题；
     * */
    @Override
    public void configure(WebSecurity web) throws Exception {
        // allow Swagger URL to be accessed without authentication
        web.ignoring().antMatchers(
                "/swagger-ui.html",
                "/v2/api-docs", // swagger api json
                "/swagger-resources/configuration/ui", // 用来获取支持的动作
                "/swagger-resources", // 用来获取api-docs的URI
                "/swagger-resources/configuration/security", // 安全选项
                "/swagger-resources/**",
                //补充路径，近期在搭建swagger接口文档时，通过浏览器控制台发现该/webjars路径下的文件被拦截，故加上此过滤条件即可。(2020-10-23)
                "/webjars/**"
        );
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.cors() //跨资源共享
                .and()
                .csrf().disable() // 关闭csrf因为不使用session
                // 配置拦截规则
                .authorizeRequests()
                .antMatchers(URL_WHITELIST).permitAll()
                .anyRequest().authenticated()
                // 登录配置
                .and()
                .formLogin().permitAll()
                .successHandler(loginSuccessHandler) //认证成功处理器
                .failureHandler(loginFailureHandler) //认证失败处理器
                //登出
                .and()
                .logout()
                .logoutSuccessHandler(jwtLogoutSuccessHandler) //登出处理器
                .permitAll()
                // 禁用session
                .and()
                .sessionManagement()
                .sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                // 异常处理器
                .and()
                .exceptionHandling()
//                .authenticationEntryPoint(jwtAuthenticationEntryPoint) //jwt认证失败,添加导致login页面404
                .accessDeniedHandler(jwtAccessDeniedHandler) //无法访问处理器
                // 配置自定义的过滤器
                .and()
                .addFilterBefore(jwtAuthenticationFilter, UsernamePasswordAuthenticationFilter.class); //jwt过滤器
        // 验证码过滤器放在UsernamePassword过滤器之前
//                .addFilterBefore(captchaFilter, UsernamePasswordAuthenticationFilter.class);

    }
}