package com.ekin.dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.ekin.dao.AdminOrderDao;
import com.ekin.entity.Order;
import com.ekin.entity.OrderPart;

public class AdminOrderDaoImpl extends BaseDaoImpl<Order> implements AdminOrderDao{

	public List<OrderPart> getOrderParts(String oid) {
		DetachedCriteria dc=DetachedCriteria.forClass(OrderPart.class);
		dc.add(Restrictions.eq("order.oid",oid));
		List<OrderPart> list = (List<OrderPart>) getHibernateTemplate().findByCriteria(dc);
		return list;
	}

}
