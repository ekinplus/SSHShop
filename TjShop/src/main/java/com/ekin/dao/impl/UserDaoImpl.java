package com.ekin.dao.impl;


import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.ekin.dao.UserDao;
import com.ekin.entity.Order;
import com.ekin.entity.User;

public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao{

	public User getUserByUP(DetachedCriteria dc) {
		List<User> list = (List<User>) getHibernateTemplate().findByCriteria(dc);
		if(list!=null && list.size()>0){
			return list.get(0);
		}else {
			return null;
		}
		
	}

	public User get(DetachedCriteria dc) {
		List<User> list = (List<User>) getHibernateTemplate().findByCriteria(dc);
		if(list!=null&&list.size()>0){
			return list.get(0);
		}else {
			return null;
		}
	}



}
