package com.example.common.security;

import com.example.entity.User;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.List;

//第二部：将用户信息填入
@Data
public class UserSecurity implements UserDetails {

    //用户信息
    private User user;

    //权限信息
    private List<SimpleGrantedAuthority> userPermissions;

    public UserSecurity(User user,List<SimpleGrantedAuthority> userPermissions){
        this.user = user;
        this.userPermissions = userPermissions;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return userPermissions;
    }

    @Override
    public String getPassword() {
        String userPassword = user.getPassword();
        user.setPassword(null);
        return userPassword;
    }

    @Override
    public String getUsername() {
        return user.getUsername();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}
