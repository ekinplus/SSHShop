package com.ekin.dao;

import org.hibernate.criterion.DetachedCriteria;

import com.ekin.entity.User;

public interface UserDao extends BaseDao<User>{

	User getUserByUP(DetachedCriteria dc);
	
	User get(DetachedCriteria dc);


}
