package com.ekin.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.ekin.entity.Order;
import com.ekin.entity.OrderPart;
import com.ekin.utils.PageBean;

public interface AdminOrderService {

	PageBean<Order> getPageBean(DetachedCriteria dc, Integer currentPage, Integer currentCount);

	Order getOrder(String oid);

	List<OrderPart> getOrderParts(String oid);

}
