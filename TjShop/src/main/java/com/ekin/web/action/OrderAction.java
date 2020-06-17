package com.ekin.web.action;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.ekin.entity.Cart;
import com.ekin.entity.CartPart;
import com.ekin.entity.Order;
import com.ekin.entity.OrderPart;
import com.ekin.entity.User;
import com.ekin.service.CartService;
import com.ekin.service.OrderService;

public class OrderAction extends ActionSupport implements ModelDriven<Order>{
	private Order order = new Order();
	private OrderService os;
	private CartService cs;
	
	public void setOs(OrderService os) {
		this.os = os;
	}

	public void setCs(CartService cs) {
		this.cs = cs;
	}
	
	public String submit2() throws Exception {
		DetachedCriteria dc=DetachedCriteria.forClass(OrderPart.class);
		dc.add(Restrictions.eq("order.oid",order.getOid()));	
		List<OrderPart> orderParts = (List<OrderPart>) ActionContext.getContext().getSession().get("orderParts");
		Order order=(Order) ActionContext.getContext().getSession().get("order");
		
		Set<OrderPart> orderParts1=new HashSet<OrderPart>(orderParts);
		order.setOrderParts(orderParts1);
		ActionContext.getContext().getSession().put("order", order);
		return "toOrder";
	}
	
	public String orderDetails() throws Exception {
		DetachedCriteria dc=DetachedCriteria.forClass(OrderPart.class);
		dc.add(Restrictions.eq("order.oid",order.getOid()));	
		List<OrderPart> orderParts = os.getOrderParts(dc);
        Order order1 =os.getOrder(order.getOid());
        
        ActionContext.getContext().getSession().put("orderParts", orderParts);
        ActionContext.getContext().getSession().put("order", order1);

		return "toOrderDetails";
	}
	
	public String toOrder() throws Exception {
		User user=(User) ActionContext.getContext().getSession().get("user");
		DetachedCriteria dc=DetachedCriteria.forClass(Order.class);
		dc.add(Restrictions.eq("user.uid", user.getUid()));	
		List<Order> orders = os.getOrders(dc);
		if (orders != null) {
			for (Order od : orders) {
				String oid = od.getOid();
				DetachedCriteria dc2=DetachedCriteria.forClass(OrderPart.class);
				dc2.add(Restrictions.eq("order.oid", oid));	
				List<OrderPart> orderParts = os.getOrderParts(dc2);
				System.out.println(od.getOrderParts().iterator());
				od.setOrderParts(new HashSet<OrderPart>());
				if (orderParts != null)
				od.getOrderParts().add(orderParts.get(0));
			}
		}
		ActionContext.getContext().getSession().put("orders", orders);

		return "toOrderList";
	}
	
	public String pay() throws Exception {
		Order order=(Order) ActionContext.getContext().getSession().get("order");
		order.setState(1);
		os.update(order);
		ActionContext.getContext().getSession().remove("order");

		return "toPaySuccess";
	}
	public String confirm() throws Exception {
		Order order1=(Order) ActionContext.getContext().getSession().get("order");
		order1.setOname(order.getOname());
		order1.setAddress(order.getAddress());
		order1.setTelephone(order.getTelephone());

		os.update(order1);
		ActionContext.getContext().getSession().put("order",order1);
		return "toPay";
	}

	public String submit() throws Exception {
		User user =(User) ActionContext.getContext().getSession().get("user");

		DetachedCriteria dc2=DetachedCriteria.forClass(Cart.class);
		dc2.add(Restrictions.eq("user.uid", user.getUid()));	
		Cart myCart =cs.getCart(dc2);
		if (myCart.getCartParts() == null) {
			return "toBuyCart";
		}

		order.setUser(user);
		order.setTotal(myCart.getTotal());
		order.setOname(null);
		order.setTelephone(null);
		order.setAddress(null);
		order.setState(0);

		os.save(order);
		Set<CartPart> CartParts = myCart.getCartParts();
		for (CartPart cp : CartParts) {
			OrderPart orderPart = new OrderPart();
			orderPart.setOrder(order);
			orderPart.setSubtotal(cp.getSubtotal());
			orderPart.setPimage(cp.getPimage());
			orderPart.setPname(cp.getPname());
			orderPart.setQuantity(cp.getQuantity());
			orderPart.setPrice(cp.getPrice());
			orderPart.setProduct(cp.getProduct());
			orderPart.setOrder(order);
			os.saveOrderPart(orderPart);
			
			order.getOrderParts().add(orderPart);
		}
		String cid = myCart.getCid();
		DetachedCriteria dc=DetachedCriteria.forClass(CartPart.class);
		dc.add(Restrictions.eq("cart.cid", cid));
		List<CartPart> cartParts=cs.getCartParts(dc);
		for(CartPart cp: cartParts){
			cs.deleteCartPart(cp);
		}
		
		myCart.setTotal(new BigDecimal(0));
		cs.save(myCart);
		ActionContext.getContext().getSession().put("order",order);
		return "toOrder";
	}
	

	public Order getModel() {
		return order;
	}
	
	
}
