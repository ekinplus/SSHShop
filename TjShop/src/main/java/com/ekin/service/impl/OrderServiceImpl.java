package com.ekin.service.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.ekin.dao.OrderDao;
import com.ekin.entity.Order;
import com.ekin.entity.OrderPart;
import com.ekin.service.OrderService;

public class OrderServiceImpl implements OrderService{
	private OrderDao od;

	public void setOd(OrderDao od) {
		this.od = od;
	}

	public void save(Order order) {
		od.save(order);
	}

	public void saveOrderPart(OrderPart orderPart) {
		od.saveOrderPart(orderPart);
	}

	public List<Order> getOrders(DetachedCriteria dc) {
		return od.getOrders(dc);
	}

	public List<OrderPart> getOrderParts(DetachedCriteria dc2) {
		return od.getOrderParts(dc2);
	}

	public void update(Order order) {
		od.update(order);
	}

	public Order getOrder(String oid) {
		return od.get(oid);
	}
	
	
}
