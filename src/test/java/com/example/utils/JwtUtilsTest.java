package com.example.utils;

import io.jsonwebtoken.Claims;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.List;

@SpringBootTest
@Slf4j
class JwtUtilsTest {
    @Autowired
    private JwtUtils jwtUtils;

    @Test
    void generateToken() {
        List<String> authList = new ArrayList<>();
        authList.add(0,"/index");
        String yuan = jwtUtils.generateToken("1","yuan",  authList);
        log.info(yuan);

        //测试解析token
        Claims claimsByToken = jwtUtils.getClaimsByToken(yuan);
        log.info(String.valueOf(claimsByToken));

        String id = claimsByToken.getId();
        Object userId = claimsByToken.get("userId");
        log.info("id" + ":=======>" + id + ";" + "userId" + ":=======>" + userId);
    }
}