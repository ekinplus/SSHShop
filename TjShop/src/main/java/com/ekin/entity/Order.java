package com.ekin.entity;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

public class Order {
	private String oid;
	private User user;
	private BigDecimal total;
	private String oname;
	private String telephone;
	private String address;
	private Integer state;
	private Set<OrderPart> orderParts= new HashSet<OrderPart>();
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public BigDecimal getTotal() {
		return total;
	}
	public void setTotal(BigDecimal total) {
		this.total = total;
	}
	public String getOname() {
		return oname;
	}
	public void setOname(String oname) {
		this.oname = oname;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Set<OrderPart> getOrderParts() {
		return orderParts;
	}
	public void setOrderParts(Set<OrderPart> orderParts) {
		this.orderParts = orderParts;
	}
	
}
