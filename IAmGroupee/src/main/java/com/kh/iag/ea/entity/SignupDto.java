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
}
