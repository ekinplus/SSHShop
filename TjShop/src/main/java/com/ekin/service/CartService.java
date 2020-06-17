package com.ekin.service;

import java.math.BigDecimal;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.ekin.entity.Cart;
import com.ekin.entity.CartPart;

public interface CartService {

	void save(Cart cart);

/*	Cart get(String uid);*/

	void saveCartPart(CartPart cartPart);

	Cart getCart(DetachedCriteria dc);

	CartPart getCartPart(DetachedCriteria dc2);

	void updateCartPart(CartPart myCartPart);

	List<CartPart> getCartParts(DetachedCriteria dc3);

	CartPart getDeleteCartPart(String partid);

	void deleteCartPart(CartPart dlcartPart);

	void update(Cart myCart);

	void deleteCartParts(String cid);

	
}
