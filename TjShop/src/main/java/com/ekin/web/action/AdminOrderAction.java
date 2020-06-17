package com.ekin.web.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.ekin.entity.Order;
import com.ekin.entity.OrderPart;
import com.ekin.service.AdminOrderService;
import com.ekin.utils.PageBean;

public class AdminOrderAction extends ActionSupport implements ModelDriven<Order>{
	private Order order=new Order();
	private AdminOrderService aos;
	private Integer currentPage;
	private Integer currentCount=8;

	public void setAos(AdminOrderService aos) {
		this.aos = aos;
	}
	
	public void orderDetails() throws Exception {
		HttpServletResponse response = ServletActionContext.getResponse();
		Order order1=aos.getOrder(order.getOid());
		List<Map<String, Object>> orderDetails=new ArrayList<Map<String,Object>>();
		List<OrderPart> orderParts=aos.getOrderParts(order.getOid());
		for(OrderPart op :orderParts){
		Map<String, Object> mapDetail=new HashMap<String, Object>();
			mapDetail.put("oid", order1.getOid());
			mapDetail.put("state", order1.getState());
			mapDetail.put("quantity", op.getQuantity());
			mapDetail.put("subtotal", op.getSubtotal());
			mapDetail.put("pimage", op.getPimage());
			mapDetail.put("pname", op.getPname());
			mapDetail.put("price", op.getPrice());
			orderDetails.add(mapDetail);
		}
		Gson gson= new Gson();
		String json=gson.toJson(orderDetails);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write(json);
	}
	
	public String getOrders() throws Exception {
		DetachedCriteria dc=DetachedCriteria.forClass(Order.class);
		PageBean<Order> orderPage=aos.getPageBean(dc,currentPage,currentCount);
		ActionContext.getContext().put("orderPage", orderPage);
		return "list";
	}


	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public Order getModel() {
		return order;
	}

}
