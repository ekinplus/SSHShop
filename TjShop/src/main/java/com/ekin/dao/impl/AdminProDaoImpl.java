package com.ekin.dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.ekin.dao.AdminProDao;
import com.ekin.entity.OrderPart;
import com.ekin.entity.Product;
import com.ekin.entity.Protype;

public class AdminProDaoImpl extends BaseDaoImpl<Product> implements AdminProDao{

	public List<Protype> getTypeList(DetachedCriteria dc) {
		List<Protype> list = (List<Protype>) getHibernateTemplate().findByCriteria(dc);
		return list;
	}

	public OrderPart getOrderPart(DetachedCriteria dc1) {
		List<OrderPart> list = (List<OrderPart>) getHibernateTemplate().findByCriteria(dc1);
		if(list!=null&&list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}

	public List<Protype> getTypeList() {
		DetachedCriteria dc=DetachedCriteria.forClass(Protype.class);
		List<Protype> list = (List<Protype>) getHibernateTemplate().findByCriteria(dc);
		return list;
	}

	public Protype getProType(String tid) {
		return getHibernateTemplate().get(Protype.class, tid);
	}

	public Product getProduct(DetachedCriteria dc) {
		List<Product> list = (List<Product>) getHibernateTemplate().findByCriteria(dc);
		if(list!=null&&list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}

	public void deleteType(String tid) {
		Protype protype = getHibernateTemplate().get(Protype.class, tid);
		getHibernateTemplate().delete(protype);
	}

	public void saveType(Protype type) {
		getHibernateTemplate().save(type);
	}

	public Protype getType(String tid) {
		return getHibernateTemplate().get(Protype.class, tid);
	}

	public void updateType(Protype type) {
		getHibernateTemplate().update(type);
	}

}
