package com.ekin.web.action;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.ekin.entity.Cart;
import com.ekin.entity.CartPart;
import com.ekin.entity.Product;
import com.ekin.entity.User;
import com.ekin.service.CartService;
import com.ekin.service.ProductService;

public class CartAction extends ActionSupport implements ModelDriven<CartPart>{
	private Cart cart=new Cart();
	private CartPart cartPart=new CartPart();
	private CartService cs;
	private ProductService ps;
	private String uid;
	private BigDecimal price;
	private BigDecimal total;
	
	public void setCs(CartService cs) {
		this.cs = cs;
	}

	public void setPs(ProductService ps) {
		this.ps = ps;
	}
	
	public String toCart() throws Exception {
		User user = (User) ActionContext.getContext().getSession().get("user");
		DetachedCriteria dc= DetachedCriteria.forClass(Cart.class);
		dc.add(Restrictions.eq("user.uid", user.getUid()));
		Cart myCart=cs.getCart(dc);
		DetachedCriteria dc2= DetachedCriteria.forClass(CartPart.class);
		dc2.add(Restrictions.eq("cart.cid", myCart.getCid()));
		List<CartPart> cartParts = cs.getCartParts(dc2);
		if(cartParts!=null)
		myCart.getCartParts().addAll(cartParts);
		ActionContext.getContext().getSession().put("cartParts", cartParts);
		ActionContext.getContext().getSession().put("myCart", myCart);
		return "toCart";
	}
	
	public String clearCart() throws Exception {
		Cart myCart=(Cart) ActionContext.getContext().getSession().get("myCart");
		myCart.setTotal(new BigDecimal(0));
		cs.deleteCartParts(myCart.getCid());
		myCart.setCartParts(null);
		cs.update(myCart);
		ActionContext.getContext().getSession().remove("myCart");
		ActionContext.getContext().getSession().put("cartParts",myCart.getCartParts());
		return "toCart";
	}
	
	public String deleteCartPart() throws Exception {
		Cart myCart = (Cart) ActionContext.getContext().getSession().get("myCart");
		CartPart dlcartPart = cs.getDeleteCartPart(cartPart.getPartid());
		myCart.setTotal(myCart.getTotal().subtract(dlcartPart.getSubtotal()));
		cs.update(myCart);
		cs.deleteCartPart(dlcartPart);
		DetachedCriteria dc= DetachedCriteria.forClass(CartPart.class);
		dc.add(Restrictions.eq("cart.cid", myCart.getCid()));
		List<CartPart> cartParts = cs.getCartParts(dc);
		if(cartParts!=null){
		myCart.setCartParts(new HashSet<CartPart>(cartParts));
		}
		ActionContext.getContext().getSession().put("myCart", myCart);
		ActionContext.getContext().getSession().put("cartParts", cartParts);
		return "toCart";
	}
	
	public String add() throws Exception {
		User user=(User) ActionContext.getContext().getSession().get("user");
		uid=user.getUid();
		DetachedCriteria dc= DetachedCriteria.forClass(Cart.class);
		dc.add(Restrictions.eq("user.uid", uid));
		BigDecimal oldtotal=new BigDecimal(0);
		Cart myCart = cs.getCart(dc);
		oldtotal=myCart.getTotal();
		Product pro = ps.get(cartPart.getProduct().getPid());
		price=pro.getPrice();
		BigDecimal c=new BigDecimal(cartPart.getQuantity().toString());
		if(oldtotal==null){
			oldtotal=new BigDecimal(0);
		}
		cartPart.setPimage(pro.getPimage());
		cartPart.setPname(pro.getPname());
		cartPart.setPrice(pro.getPrice());
		cartPart.setSubtotal(price.multiply(c));
		cartPart.setProduct(pro);
		cartPart.setCart(myCart);
		
		DetachedCriteria dc2= DetachedCriteria.forClass(CartPart.class);
		dc2.add(Restrictions.eq("product.pid", pro.getPid()));
		dc2.add(Restrictions.eq("cart.cid", myCart.getCid()));
		CartPart myCartPart = cs.getCartPart(dc2);
		BigDecimal newsubtotal=new BigDecimal(0);
		if (myCartPart != null) {
			int oldQuantity = myCartPart.getQuantity();
			oldQuantity += cartPart.getQuantity();
			myCartPart.setQuantity(oldQuantity);
			myCartPart.setCart(myCart);
			myCartPart.setProduct(pro);
			BigDecimal oldsubtotal = myCartPart.getSubtotal();
			BigDecimal quantity = new BigDecimal(cartPart.getQuantity());
			newsubtotal=quantity.multiply(pro.getPrice());
			myCartPart.setSubtotal(oldsubtotal.add(newsubtotal));
			cs.updateCartPart(myCartPart);

		} else {
			newsubtotal = price.multiply(c);
			cs.updateCartPart(cartPart);
			myCart.getCartParts().add(cartPart);
		}
		total=oldtotal.add(newsubtotal);
		myCart.setTotal(total);
		cs.save(myCart);
		DetachedCriteria dc3= DetachedCriteria.forClass(CartPart.class);
		dc3.add(Restrictions.eq("cart.cid", myCart.getCid()));
		List<CartPart> cartParts = cs.getCartParts(dc3);
		myCart.setCartParts(new HashSet<CartPart>(cartParts));
		ActionContext.getContext().getSession().put("myCart", myCart);
		ActionContext.getContext().getSession().put("cartParts", cartParts);
		
		return "toCart";
	}
	
	public String creat() throws Exception {
		User user=(User) ActionContext.getContext().getSession().get("user");
		cart.setUser(user);
		cs.save(cart);
		return "toIndex";
	}
	
	
	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public CartPart getModel() {
		return cartPart;
	}

}
