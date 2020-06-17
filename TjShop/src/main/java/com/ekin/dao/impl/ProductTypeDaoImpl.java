package com.ekin.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.ekin.dao.ProductTypeDao;
import com.ekin.entity.Protype;

public class ProductTypeDaoImpl extends HibernateDaoSupport implements ProductTypeDao{

	public List<Protype> getProTypeList() {
			List<Protype> list = (List<Protype>) getHibernateTemplate().find("from Protype");
			return list;
	}

	@Override
	public Protype get(String tid) {
		return getHibernateTemplate().get(Protype.class, tid);
	}

}
