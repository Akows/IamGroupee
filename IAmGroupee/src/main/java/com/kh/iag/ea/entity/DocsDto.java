package com.kh.iag.ea.entity;

import java.util.Date;

import lombok.Data;

@Data
public class DocsDto {

	private String docNo; 		// 문서번호
	private String userNo; 		// 기안자 사번
	private String formNo;		// 양식번호
	private String procNo;		// 결재선번호
	private String docTitle;	// 문서제목
	private String docContent;	// 문서내용
	private String docSlv;		// 문서보안레벨
	private Date docMake;		// 상신일
	private Date docClose;		// 마감일
	private Date docFinish;		// 승인일
	private String docSep;		// 문서승인구분
	
	// 더 필요할 것 같은 정보 - name, formTitle, 부서, 직급
	private String name;		// 기안자 이름
	private String positionName;// 직급
	private String departmentName; // 부서 
	private String formTitle;	// 양식이름
	private String simpleMakeDate; // 데이트 포맷 상신일
	private String simpleCloseDate;// 데이트 포맷 마감일
	
	
	// 휴가, 연차를 위한 변수
	// 휴가 - 휴가관련문서여부(휴가) 휴가코드(휴가) 시작날짜(휴가) 끝날짜(휴가)
	// 연차 - 연차관련문서여부(연차) 연차코드(연차) 연차날짜(연차) 반차시오전오후(연차)
}
