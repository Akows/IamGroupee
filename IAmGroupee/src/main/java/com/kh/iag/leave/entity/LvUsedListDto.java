package com.kh.iag.leave.entity;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class LvUsedListDto {
	private int usageAlvNo;
	private String userNo;
	private String name;
	private String docNo;
	private String departmentName;
	private String lvCode;
	private String lvName;
	private String lvAppli;
	 @DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date lvStart;
	 @DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date lvEnd;
	private String during;
	private String lvReason;
	private float reduceAlv;
	private float alvTotalReduce;
}
