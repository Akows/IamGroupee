package com.kh.iag.sch.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class SchDto {

	private int schNum;
	private String userNo;
	private String schTitle;
	 @DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date schStart;
	 @DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date schEnd;
	private String schStartStr;
	private String schEndStr;
	private String schEnroll;
	private String schType;
	private String schContent;
	
}
