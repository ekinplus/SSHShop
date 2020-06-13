package com.zyj.epidemic.service.impl;

import com.zyj.epidemic.beans.UserInfo;
import com.zyj.epidemic.mapper.UserMapper;
import com.zyj.epidemic.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;
    @Override
    public UserInfo findByAccount(String account) {
        return userMapper.findByAccount(account);
    }
}
