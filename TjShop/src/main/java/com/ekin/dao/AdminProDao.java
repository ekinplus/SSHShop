package com.ekin.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.ekin.dao.BaseDao;
import com.ekin.entity.OrderPart;
import com.ekin.entity.Product;
import com.ekin.entity.Protype;

public interface AdminProDao extends BaseDao<Product>{

	List<Protype> getTypeList(DetachedCriteria dc);

	OrderPart getOrderPart(DetachedCriteria dc1);

	List<Protype> getTypeList();

	Protype getProType(String tid);

	Product getProduct(DetachedCriteria dc);

	void deleteType(String tid);

	void saveType(Protype type);

	Protype getType(String tid);

	void updateType(Protype type);

}
