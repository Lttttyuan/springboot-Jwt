package com.example.utils;

import io.jsonwebtoken.*;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

@Data
@Component
@Slf4j
public class JwtUtils {

    @Value("${my.token.expire}")
    private long expire; //7天，s为单位
    @Value("${my.token.secret}")
    private String secret; //密钥
    @Value("${my.token.header}")
    private String header;

    /**
     * 生成JWT
     *
     * @param userInfo
     * @param username
     * @param authList 权限集合
     * @return
     */
    public String generateToken(String username, String userInfo, List<String> authList) {

        Date nowDate = new Date();
        Date expireDate = new Date(nowDate.getTime() + 1000 * expire);

        return Jwts.builder()
                .setHeaderParam("alg", "HS512")
                .setHeaderParam("typ", "JWT")
                .setSubject(username) //签发人
                .setIssuedAt(nowDate) //签发时间
                .setExpiration(expireDate)    // 7天过期
                //自定义声明
                .claim("userInfo", userInfo)
                .claim("userAuth", authList)
                .signWith(SignatureAlgorithm.HS512, secret) //secret作为密钥
                .compact();
    }

    /**
     * 判断JWT是否过期,过期则返回null,未过期,则解析JWT
     *
     * @param jwt
     * @return
     */
    public Claims getClaimsByToken(String jwt) {
        try {
             return Jwts.parser()
                    .setSigningKey(secret)
                    .parseClaimsJws(jwt)
                    .getBody();
        } catch (Exception e) {
            log.error("token异常");
            return null;
        }
    }

    // 判断JWT是否过期
    public boolean isTokenExpired(Claims claims) {
        return claims.getExpiration().before(new Date());
    }
}