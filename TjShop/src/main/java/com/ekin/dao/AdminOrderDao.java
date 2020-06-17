package com.ekin.dao;

import java.util.List;

import com.ekin.entity.Order;
import com.ekin.entity.OrderPart;

public interface AdminOrderDao extends BaseDao<Order>{

	List<OrderPart> getOrderParts(String oid);

}
