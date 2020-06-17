package com.ekin.entity;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

public class Cart {
	private String cid;
	private BigDecimal total;
	private Set<CartPart> cartParts = new HashSet<CartPart>();
	private User user;

	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Set<CartPart> getCartParts() {
		return cartParts;
	}
	public void setCartParts(Set<CartPart> cartParts) {
		this.cartParts = cartParts;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public BigDecimal getTotal() {
		return total;
	}
	public void setTotal(BigDecimal total) {
		this.total = total;
	}
	

}
