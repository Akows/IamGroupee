package com.kh.iag.ps.admin.entity;

import lombok.Data;

@Data
public class PageVo {
	private int currentPage;//현재 페이지
	private int cntPerPage;	//페이지 하나당 보여줄 row 개수
	private int pageBtnCnt; //페이지 버튼 개수
	private int totalRow;	//테이블 전체의 row 개수
	
	private int startRow;	//디비가서 조회할 rownum
	private int endRow;		//디비가서 조회할 rownum
	private int startPage;	//시작 페이지
	private int endPage;	//마지막 페이지
	private int lastPage;	//DB 의 ROW 기준으로 마지막 페이지는 몇인지
	private String search;
	
	public PageVo(String currentPage, int cntPerPage, int pageBtnCnt, int totalRow) {
		this.currentPage = Integer.parseInt(currentPage);
		this.cntPerPage = cntPerPage;
		this.pageBtnCnt = pageBtnCnt;
		this.totalRow = totalRow;
		calc(this.currentPage, cntPerPage, pageBtnCnt, totalRow);
	}
	
	public PageVo(String currentPage, int totalRow) {
		this.currentPage = Integer.parseInt(currentPage);
		this.cntPerPage = 10;
		this.pageBtnCnt = 5;
		this.totalRow = totalRow;
		calc(this.currentPage, cntPerPage, pageBtnCnt, totalRow);
	}
	
	public PageVo(int currentPage, int cntPerPage, int pageBtnCnt, int totalRow) {
		this.currentPage = currentPage;
		this.cntPerPage = cntPerPage;
		this.pageBtnCnt = pageBtnCnt;
		this.totalRow = totalRow;
		calc(currentPage, cntPerPage, pageBtnCnt, totalRow);
	}
	
	
	
	private void calc(int currentPage, int ctnPerPage, int pageBtnCnt, int totalRow) {
		this.setEndRow(this.getCurrentPage() * this.getCntPerPage());
		this.setStartRow(this.getEndRow() - this.getCntPerPage() + 1);
		int lastPage = this.getTotalRow() / this.getCntPerPage();
		if(this.getTotalRow() % this.getCntPerPage()> 0) {
			lastPage++;
		}
		this.setLastPage(lastPage);
		
		int endPage = this.getCurrentPage() / this.getPageBtnCnt();
		if( this.getCurrentPage() % this.getPageBtnCnt()>0) {
			endPage++;
		}
		this.setEndPage(endPage* this.getPageBtnCnt());
		if(endPage > lastPage) { this.setEndPage(lastPage); }

		this.setStartPage(this.getEndPage() - this.getPageBtnCnt() +1);
	}



	
} 
