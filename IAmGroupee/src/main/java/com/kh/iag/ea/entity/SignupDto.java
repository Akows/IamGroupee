package com.kh.iag.ea.entity;

import java.util.Date;

import lombok.Data;

@Data
public class SignupDto {

	private String[] approverName; 	// 결재자 이름
	private String[] approverNo;	// 결재자 사번
	private String[] referNo;		// 참조자 사번
	private String securityLevel;	// 문서보안 등급
	private Date deadlineDate;		// 마감날짜
	private String title;			// 제목
	private String content;			// 문서내용
	private String formNo;			// 양식번호
	private String formTitle;
	private String formYears;
	private String categoryNo;
	private String categoryName;
	private String userNo;			// 작성자
	
	
	// 휴가, 연차를 위한 변수
	private String lvCheck; // "연차" or "휴가" /  A, B? - 연차인지 휴가인지 체크
	private String lvCode;	// 연차 또는 휴가 코드
	
	// 연차 - 연차관련문서여부(연차) 연차코드(연차) 연차날짜(연차) 반차시오전오후(연차)
	private Date alvAppli;		// 연차신청일
	private Date alvStart;		// 연차시작일
	private Date alvEnd;		// 연차종료일
	private String alvReason; 	// 연차사유
	
	// 휴가 - 휴가관련문서여부(휴가) 휴가코드(휴가) 시작날짜(휴가) 끝날짜(휴가)
	private Date lvAppli;		// 휴가신청일
	private Date lvStart;		// 휴가시작일
	private Date lvEnd;			// 휴가종료일
	private String lvReason;	// 휴가사유
}
