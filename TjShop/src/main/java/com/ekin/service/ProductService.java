package com.ekin.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.ekin.entity.Product;
import com.ekin.utils.PageBean;

public interface ProductService {

	PageBean<Product> getProPageBean(DetachedCriteria dc, Integer currentPage, Integer currentCount);

	Product get(String pid);

	
}
