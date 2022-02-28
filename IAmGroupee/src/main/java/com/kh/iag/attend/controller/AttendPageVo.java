package com.kh.iag.attend.controller;

import lombok.Data;

@Data
public class AttendPageVo 
{
	private int currentPage;
	private int cntPerPage;	
	private int pageBtnCnt;
	private int totalRow;
	
	private int startRow;
	private int endRow;	
	private int startPage;
	private int endPage;
	private int lastPage;
	
	public AttendPageVo(String currentPageStr, int cntPerPage, int pageBtnCnt, int totalRow) 
	{
		this.currentPage = Integer.parseInt(currentPageStr);
		this.cntPerPage = cntPerPage;
		this.pageBtnCnt = pageBtnCnt;
		this.totalRow = totalRow;
		calc(currentPage, cntPerPage, pageBtnCnt, totalRow);
	}
	
	private void calc(int currentPage, int cntPerPage, int pageBtnCnt, int totalRow)
	{
		
		this.setEndRow(this.getCurrentPage() * this.getCntPerPage());
		this.setStartRow(this.getEndRow() - this.getCntPerPage() + 1);
		
		int lastPage = this.getTotalRow() / this.getCntPerPage();
		if(this.getTotalRow() % this.getCntPerPage() > 0) {
			lastPage++;
		}
		this.setLastPage(lastPage);
		
		int endPage = this.getCurrentPage() / this.getPageBtnCnt();
		if(this.getCurrentPage() % this.getPageBtnCnt() > 0) {
			endPage++;
		}
		
		this.setEndPage(endPage * this.getPageBtnCnt());
		
		this.setStartPage(this.getEndPage() - this.getPageBtnCnt() + 1);
		
	}
}












