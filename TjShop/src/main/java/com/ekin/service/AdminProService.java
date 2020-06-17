package com.ekin.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.ekin.entity.OrderPart;
import com.ekin.entity.Product;
import com.ekin.entity.Protype;
import com.ekin.utils.PageBean;

public interface AdminProService {

	PageBean<Product> getProPageBean(DetachedCriteria dc, Integer currentPage, Integer currentCount);

	List<Protype> getTypeList(DetachedCriteria dc);

	void save(Product product);

	OrderPart getOrderPart(DetachedCriteria dc1);

	void deleteProduct(Product product);

	List<Protype> getTypeList();

	Product getProduct(String pid);

	Protype getProType(String tid);

	void updateProduct(Product product);

	Product getProduct(DetachedCriteria dc);

	void deleteType(String tid);

	void saveType(Protype type);

	Protype getType(String tid);

	void updateType(Protype type);

}
