package com.ekin.dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.ekin.dao.AdminUserDao;
import com.ekin.entity.Admin;

public class AdminUserDaoImpl extends BaseDaoImpl<Admin> implements AdminUserDao{

	public Admin getAdmin(Admin admin) {
		DetachedCriteria dc =DetachedCriteria.forClass(Admin.class);
		dc.add(Restrictions.eq("username", admin.getUsername()));
		dc.add(Restrictions.eq("password", admin.getPassword()));
		List<Admin> list = (List<Admin>) getHibernateTemplate().findByCriteria(dc);
		if(list!=null&&list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}

}
