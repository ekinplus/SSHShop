package com.ekin.service.impl;

import com.ekin.dao.AdminUserDao;
import com.ekin.entity.Admin;
import com.ekin.service.AdminUserService;

public class AdminUserServiceImpl implements AdminUserService{
	private AdminUserDao aud;

	public void setAud(AdminUserDao aud) {
		this.aud = aud;
	}

	public Admin getAdmin(Admin admin) {
		return aud.getAdmin(admin);
	}
	
}
