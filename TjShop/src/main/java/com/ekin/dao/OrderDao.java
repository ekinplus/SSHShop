package com.ekin.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.ekin.entity.Order;
import com.ekin.entity.OrderPart;

public interface OrderDao extends BaseDao<Order>{

	void saveOrderPart(OrderPart orderPart);

	List<Order> getOrders(DetachedCriteria dc);

	List<OrderPart> getOrderParts(DetachedCriteria dc2);
	
}
