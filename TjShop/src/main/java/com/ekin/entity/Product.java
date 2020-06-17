package com.ekin.entity;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

public class Product {
	
	private String pid;
	private String pname;
	private String pimage;
	private BigDecimal price;
	private BigDecimal sprice;
	private String pdesc;
	private Protype protype;
	private Set<CartPart> CartPatrs=new HashSet<CartPart>();
	private Set<OrderPart> OrderParts=new HashSet<OrderPart>();
	private String tid;

	
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public Set<OrderPart> getOrderParts() {
		return OrderParts;
	}
	public void setOrderParts(Set<OrderPart> orderParts) {
		OrderParts = orderParts;
	}
	public Set<CartPart> getCartPatrs() {
		return CartPatrs;
	}
	public void setCartPatrs(Set<CartPart> cartPatrs) {
		CartPatrs = cartPatrs;
	}
	public BigDecimal getSprice() {
		return sprice;
	}
	public void setSprice(BigDecimal sprice) {
		this.sprice = sprice;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPimage() {
		return pimage;
	}
	public void setPimage(String pimage) {
		this.pimage = pimage;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public String getPdesc() {
		return pdesc;
	}
	public void setPdesc(String pdesc) {
		this.pdesc = pdesc;
	}
	public Protype getProtype() {
		return protype;
	}
	public void setProtype(Protype protype) {
		this.protype = protype;
	}
}
