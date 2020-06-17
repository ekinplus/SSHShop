package com.ekin.service.impl;

import org.hibernate.criterion.DetachedCriteria;

import com.ekin.dao.UserDao;
import com.ekin.entity.User;
import com.ekin.service.UserService;

public class UserServiceImpl implements UserService{

	private UserDao ud;

	public void saveUser(User u) {
		ud.save(u);
	}

	public void setUd(UserDao ud) {
		this.ud = ud;
	}
	public User loginUser(DetachedCriteria dc) {
		User u=ud.getUserByUP(dc);
		if(u==null){
			throw new RuntimeException("用户名或密码错误！");
		}
		return u;
	}


	public void updateUser(User user) {
		ud.update(user);
	}

	public User get(DetachedCriteria dc) {
		return ud.get(dc);
	}


}
