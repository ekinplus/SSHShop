package com.ekin.dao;

import com.ekin.entity.Admin;

public interface AdminUserDao extends BaseDao<Admin>{

	Admin getAdmin(Admin admin);

}
