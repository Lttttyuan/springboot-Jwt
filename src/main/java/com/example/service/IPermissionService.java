package com.example.service;

import com.example.entity.Permission;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author author
 * @since 2023-08-22
 */
@Service
public interface IPermissionService extends IService<Permission> {

    List<String>  getAllUserPermissions(Integer id);
}
