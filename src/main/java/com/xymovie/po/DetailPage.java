package com.xymovie.po;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

/**
 * 电影分页显示类
 * @author Administrator
 *
 */
public class DetailPage {
	
	private int pageSize; //每页显示条数
	private int currentPage; //当前页
	private int currentDate; //当前到第几条
	
	public int getCurrentDate() {
		return currentDate;
	}


	public int getPageSize() {
		return pageSize;
	}


	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}


	public int getCurrentPage() {
		return currentPage;
	}


	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}


	public DetailPage() {
		super();
	}


	public DetailPage(int pageSize, int currentPage) {
		super();
		this.pageSize = pageSize;
		this.currentPage = currentPage;
		this.currentDate = pageSize * (currentPage - 1);
	}
	
}
