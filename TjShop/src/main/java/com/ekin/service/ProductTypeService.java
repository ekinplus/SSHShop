package com.ekin.service;

import java.util.List;

import com.ekin.entity.Protype;

public interface ProductTypeService {

	List<Protype> getProTypeList();


    Protype getType(String tid);
}
