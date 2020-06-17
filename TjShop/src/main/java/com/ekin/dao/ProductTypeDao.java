package com.ekin.dao;

import java.util.List;

import com.ekin.entity.Order;
import com.ekin.entity.Protype;

public interface ProductTypeDao{

	List<Protype> getProTypeList();

    Protype get(String tid);
}
