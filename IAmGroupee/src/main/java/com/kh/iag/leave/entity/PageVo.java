package com.kh.iag.leave.entity;

import lombok.Data;

@Data
public class PageVo {
	// 알아야 할 것
	private int startRow; // 디비에서 조회할 rownum
	private int cntPerPage; // 한 페이지 당 글 개수
	private int pageBtnCnt; // 페이지버튼을 몇개씩 보여줄 것인지
	private int totalRow; // 테이블의 전체 row개
	
	// db에서 값을 받아올 값
	private int endRow; // 디비에서 조회할 rownum
	private int startPage;
	private int endPage;
	private int currentPage;
	private int lastPage; 

	public PageVo(String currentPage, int cntPerPage, int pageBtnCnt, int totalRow) {
		this.cntPerPage = cntPerPage;
		this.pageBtnCnt = pageBtnCnt;
		this.totalRow = totalRow;
		this.currentPage = Integer.parseInt(currentPage);
		calc(Integer.parseInt(currentPage), cntPerPage, pageBtnCnt, totalRow);
	}

	public PageVo(int currentPage, int cntPerPage, int pageBtnCnt, int totalRow) {
		this.cntPerPage = cntPerPage;
		this.pageBtnCnt = pageBtnCnt;
		this.totalRow = totalRow;
		this.currentPage = currentPage;
		calc(currentPage, cntPerPage, pageBtnCnt, totalRow);
	}
	
	private void calc(int currentPage, int cntPerPage, int pageBtnCnt, int totalRow) {
        // 계산 처리
        // 나머지 5개 값 셋팅
        this.setEndRow(this.getCurrentPage() * this.getCntPerPage());
        this.setStartRow(this.getEndRow() - this.getCntPerPage() + 1);
        
        int lastPage = this.getTotalRow() / this.getCntPerPage();
        if(this.getTotalRow() % this.getCntPerPage()>0) {
            lastPage++;    
        }
        this.setLastPage(lastPage);
        
        int endPage = this.getCurrentPage() / this.getPageBtnCnt();
        if(this.getCurrentPage() % this.getPageBtnCnt() > 0) {
            endPage++;
        }
        
        if(endPage > lastPage) {
        	endPage = lastPage;
        }
        
        this.setEndPage(endPage * this.getPageBtnCnt());
        
        this.setStartPage(this.getEndPage() - this.getPageBtnCnt() + 1);
    }

}
