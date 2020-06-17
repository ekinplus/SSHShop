package com.ekin.service;

import org.hibernate.criterion.DetachedCriteria;

import com.ekin.entity.User;

public interface UserService {


	void saveUser(User u);

	User loginUser(DetachedCriteria dc);

	void updateUser(User user);

	User get(DetachedCriteria dc);

}
