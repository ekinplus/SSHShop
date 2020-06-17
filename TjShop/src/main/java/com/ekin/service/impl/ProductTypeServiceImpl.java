package com.ekin.service.impl;

import java.util.List;

import com.ekin.dao.ProductTypeDao;
import com.ekin.entity.Protype;
import com.ekin.service.ProductTypeService;

public class ProductTypeServiceImpl implements ProductTypeService{

	private ProductTypeDao ptd;
	
	public void setPtd(ProductTypeDao ptd) {
		this.ptd = ptd;
	}

	public List<Protype> getProTypeList() {
		List<Protype> typeList=ptd.getProTypeList();
		return typeList;
	}

	@Override
	public Protype getType(String tid) {
		return ptd.get(tid);
	}


}
