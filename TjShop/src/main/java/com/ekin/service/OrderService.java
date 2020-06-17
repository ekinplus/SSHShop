package com.ekin.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.ekin.entity.Order;
import com.ekin.entity.OrderPart;

public interface OrderService {

	void save(Order order);

	void saveOrderPart(OrderPart orderPart);

	List<Order> getOrders(DetachedCriteria dc);

	List<OrderPart> getOrderParts(DetachedCriteria dc2);

	void update(Order order);

	Order getOrder(String oid);

}
