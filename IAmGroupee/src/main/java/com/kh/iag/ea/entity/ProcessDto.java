package com.kh.iag.ea.entity;

import lombok.Data;

@Data
public class ProcessDto {
	private String procNo;	// 결재선 번호
	private String userNo;	// 결재자 사원번호
	private int procSep;	// 결재 순서 번호 (1 ~ 5)
	private int procSeq;	// 결재 구분 0(대기), 1(승인), 2(반려) 3(협의요청), 4(전결)
	private String docNo;	// 문서번호
	private int procCnt; 	// 결재자 몇명인지 표시하는 컬럼
	private String procRejected; // 반려/협요 사유
	
	// 추가
	private String name;
	private String positionName;
	private String departmentName;
}
