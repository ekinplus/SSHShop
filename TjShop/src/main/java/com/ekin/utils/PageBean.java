package com.ekin.utils;

import java.util.List;

public class PageBean<T> {
	private Integer currentPage;
	private Integer currentCount;
	private Integer totalCount;
	private Integer totalPage;
	private List<T> list;
	
	
	
	public PageBean(Integer currentPage, Integer currentCount, Integer totalCount) {
		this.currentPage = currentPage;
		this.currentCount = currentCount;
		this.totalCount = totalCount;
		
		if(this.currentPage == null){
			this.currentPage = 1;
		}
		
		if(this.currentCount == null){
			this.currentCount = 3;
		}
		
		this.totalPage = (int) Math.ceil(1.0*totalCount/currentCount);
	}
	public int getIndex(){
		return (this.currentPage-1)*this.currentCount;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getCurrentCount() {
		return currentCount;
	}
	public void setCurrentCount(int currentCount) {
		this.currentCount = currentCount;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
}
