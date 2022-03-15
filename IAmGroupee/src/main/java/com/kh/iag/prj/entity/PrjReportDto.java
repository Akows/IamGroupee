package com.kh.iag.prj.entity;

import java.sql.Date;

import lombok.Data;

@Data
public class PrjReportDto {

	private int reportNo;
	private int prjNo;
	private String userNo;
	private String reportType;
	private String reportName;
	private String reportContent;
	private Date createDate;
	private Date modDate;
	private String deleteYn;
	private int commNum;
	private int checkNum;
}
