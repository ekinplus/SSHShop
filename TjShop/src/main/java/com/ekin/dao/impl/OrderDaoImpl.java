package com.ekin.dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.ekin.dao.OrderDao;
import com.ekin.entity.Order;
import com.ekin.entity.OrderPart;

public class OrderDaoImpl extends BaseDaoImpl<Order> implements OrderDao{

	public void saveOrderPart(OrderPart orderPart) {
		getHibernateTemplate().save(orderPart);
	}

	public List<Order> getOrders(DetachedCriteria dc) {
		List<Order> list = (List<Order>) getHibernateTemplate().findByCriteria(dc);
		if(list!=null&&list.size()>0){
			return list;
		}else {
			return null;
		}
	}

	public List<OrderPart> getOrderParts(DetachedCriteria dc2) {
		List<OrderPart> list = (List<OrderPart>) getHibernateTemplate().findByCriteria(dc2);
		if(list!=null&&list.size()>0){
			return list;
		}else {
			return null;
		}
	}

}
