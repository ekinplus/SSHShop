package com.zyj.epidemic.service;

import com.zyj.epidemic.beans.UserInfo;

public interface UserService {
    UserInfo findByAccount(String account);
}
