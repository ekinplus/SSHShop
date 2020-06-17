package com.ekin.service.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.ekin.dao.ProductDao;
import com.ekin.entity.Product;
import com.ekin.service.ProductService;
import com.ekin.utils.PageBean;

public class ProductServiceImpl implements ProductService{
	
	private ProductDao pd;
	
	public void setPd(ProductDao pd) {
		this.pd = pd;
	}

	public PageBean<Product> getProPageBean(DetachedCriteria dc, Integer currentPage, Integer currentCount) {
		
		Integer totalCount = pd.getTotalCount(dc);
		PageBean<Product> pb=new PageBean<Product>(currentPage, currentCount, totalCount);
		int index = pb.getIndex();
	    List<Product> list = pd.getPageList(dc, index, pb.getCurrentCount());
	    pb.setList(list);
		
		return pb;
		
	}

	public Product get(String pid) {
		return pd.get(pid);
	}


}
