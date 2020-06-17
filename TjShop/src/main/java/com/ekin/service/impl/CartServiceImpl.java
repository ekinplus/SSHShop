package com.ekin.service.impl;

import java.math.BigDecimal;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.ekin.dao.CartDao;
import com.ekin.entity.Cart;
import com.ekin.entity.CartPart;
import com.ekin.service.CartService;

public class CartServiceImpl implements CartService{
	private CartDao cd;

	public void setCd(CartDao cd) {
		this.cd = cd;
	}

	public void save(Cart cart) {
		cd.save(cart);
	}

/*	public Cart get(String uid) {
		return cd.get(uid);
	}*/

	public void saveCartPart(CartPart cartPart) {
		cd.saveCartPart(cartPart);
	}

	public Cart getCart(DetachedCriteria dc) {
		return cd.getCart(dc);
	}

	public CartPart getCartPart(DetachedCriteria dc2) {
		return cd.getCartPart(dc2);
	}

	public void updateCartPart(CartPart myCartPart) {
		cd.updateCartPart(myCartPart);
	}

	public List<CartPart> getCartParts(DetachedCriteria dc3) {
		return cd.getCartParts(dc3);
	}

	public CartPart getDeleteCartPart(String partid) {
		return cd.getDeleteCartPart(partid);
	}

	public void deleteCartPart(CartPart cartPart) {
		cd.deleteCartPart(cartPart);
	}

	public void update(Cart myCart) {
		cd.update(myCart);
	}

	public void deleteCartParts(String cid) {
		cd.deleteCartParts(cid);
	}
	
}
