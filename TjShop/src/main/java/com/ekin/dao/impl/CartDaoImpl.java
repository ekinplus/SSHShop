package com.ekin.dao.impl;

import java.math.BigDecimal;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.HibernateCallback;

import com.ekin.dao.CartDao;
import com.ekin.entity.Cart;
import com.ekin.entity.CartPart;


public class CartDaoImpl extends BaseDaoImpl<Cart>implements CartDao{

	/*public BigDecimal getToal(DetachedCriteria dc) {
		dc.setProjection(Projections.property("total"));
		List<BigDecimal> list = (List<BigDecimal>) getHibernateTemplate().findByCriteria(dc);
		if(list!=null&&list.size()>0){
			return list.get(0);
		}else{
			return null;

		}
	}*/

	public void saveCartPart(CartPart cartPart) {
		getHibernateTemplate().save(cartPart);
	}

	public Cart getCart(DetachedCriteria dc) {
		List<Cart> list = (List<Cart>) getHibernateTemplate().findByCriteria(dc);
		return list.get(0);
	}

	public CartPart getCartPart(DetachedCriteria dc2) {
		List<CartPart> list = (List<CartPart>) getHibernateTemplate().findByCriteria(dc2);
		if(list!=null&&list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}

	public void updateCartPart(CartPart myCartPart) {
		getHibernateTemplate().save(myCartPart);
	}

	public List<CartPart> getCartParts(DetachedCriteria dc3) {
		List<CartPart> list = (List<CartPart>) getHibernateTemplate().findByCriteria(dc3);
		if(list!=null&&list.size()>0){
			return list;
		}else{
			return null;
		}
	}

	public CartPart getDeleteCartPart(String partid) {
		return getHibernateTemplate().get(CartPart.class, partid);
	}

	public void deleteCartPart(CartPart cartPart) {
		getHibernateTemplate().delete(cartPart);
	}

	public void deleteCartParts(String cid) {
		DetachedCriteria dc=DetachedCriteria.forClass(CartPart.class);
		dc.add(Restrictions.eq("cart.cid", cid));
		List<CartPart> list = (List<CartPart>) getHibernateTemplate().findByCriteria(dc);
			getHibernateTemplate().deleteAll(list);
	}

}
