package com.ekin.dao;

import java.math.BigDecimal;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.ekin.entity.Cart;
import com.ekin.entity.CartPart;

public interface CartDao extends BaseDao<Cart>{

	void saveCartPart(CartPart cartPart);

	Cart getCart(DetachedCriteria dc);

	CartPart getCartPart(DetachedCriteria dc2);

	void updateCartPart(CartPart myCartPart);

	List<CartPart> getCartParts(DetachedCriteria dc3);

	CartPart getDeleteCartPart(String partid);

	void deleteCartPart(CartPart cartPart);

	void deleteCartParts(String cid);

}
