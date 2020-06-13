package com.zyj.epidemic.mapper;

import com.zyj.epidemic.beans.UserInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface UserMapper {

    @Select(value="SELECT u.`user_id`,u.`account`,u.`password`,u.`user_name` " +
            "FROM users u " +
            "WHERE u.`account`=#{account} "
            )
    UserInfo findByAccount(String account);
}
