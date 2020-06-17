package com.ekin.service.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.ekin.dao.AdminProDao;
import com.ekin.entity.OrderPart;
import com.ekin.entity.Product;
import com.ekin.entity.Protype;
import com.ekin.service.AdminProService;
import com.ekin.utils.PageBean;

public class AdminProServiceImpl implements AdminProService{
	private AdminProDao apd;

	public void setApd(AdminProDao apd) {
		this.apd = apd;
	}

	public PageBean<Product> getProPageBean(DetachedCriteria dc, Integer currentPage, Integer currentCount) {
		Integer totalCount = apd.getTotalCount(dc);
		PageBean<Product> pb=new PageBean<Product>(currentPage, currentCount, totalCount);
		int index = pb.getIndex();
	    List<Product> list = apd.getPageList(dc, index, pb.getCurrentCount());
	    pb.setList(list);
		
		return pb;
	}

	public List<Protype> getTypeList(DetachedCriteria dc) {
		return apd.getTypeList(dc);
	}

	public void save(Product product) {
		apd.save(product);
	}

	public OrderPart getOrderPart(DetachedCriteria dc1) {
		return apd.getOrderPart(dc1);
	}

	public void deleteProduct(Product product) {
		apd.delete(product);
		
	}

	public List<Protype> getTypeList() {
		return apd.getTypeList();
	}

	public Product getProduct(String pid) {
		return apd.get(pid);
	}

	public Protype getProType(String tid) {
		return apd.getProType(tid);
	}

	public void updateProduct(Product product) {
		apd.update(product);
	}

	public Product getProduct(DetachedCriteria dc) {
		return apd.getProduct(dc);
	}

	public void deleteType(String tid) {
		apd.deleteType(tid);
	}

	public void saveType(Protype type) {
		apd.saveType(type);
	}

	public Protype getType(String tid) {
		return apd.getType(tid);
	}

	public void updateType(Protype type) {
		apd.updateType(type);
	}

	
}
