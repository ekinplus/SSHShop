package com.ekin.service.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.ekin.dao.AdminOrderDao;
import com.ekin.entity.Order;
import com.ekin.entity.OrderPart;
import com.ekin.entity.Product;
import com.ekin.service.AdminOrderService;
import com.ekin.utils.PageBean;

public class AdminOrderServiceImpl implements AdminOrderService{
	private AdminOrderDao aod;

	public void setAod(AdminOrderDao aod) {
		this.aod = aod;
	}

	public PageBean<Order> getPageBean(DetachedCriteria dc, Integer currentPage, Integer currentCount) {
		Integer totalCount = aod.getTotalCount(dc);
		PageBean<Order> pb=new PageBean<Order>(currentPage, currentCount, totalCount);
		int index = pb.getIndex();
	    List<Order> list = aod.getPageList(dc, index, pb.getCurrentCount());
	    pb.setList(list);
		
		return pb;
	}

	public Order getOrder(String oid) {
		return aod.get(oid);
	}

	public List<OrderPart> getOrderParts(String oid) {
		return aod.getOrderParts(oid);
	}
	
	
}
