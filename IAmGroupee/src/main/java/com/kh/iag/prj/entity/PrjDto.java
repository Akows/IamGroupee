package com.kh.iag.prj.entity;

import java.sql.Date;

import lombok.Data;
@Data
public class PrjDto {

	private int prjNo;
	private String userNo;
	private String prjName;
	private int departNo;
	private Date createDate;
	private String startDate;
	private String endDate;
	private String openYn;
	private String activateYn;
	private String deleteYn;
	
	private String period;

	@Override
	public String toString() {
		return "PrjDto [prjNo=" + prjNo + ", userNo=" + userNo + ", prjName=" + prjName + ", departNo=" + departNo
				+ ", createDate=" + createDate + ", startDate=" + startDate + ", endDate=" + endDate + ", openYn="
				+ openYn + ", activateYn=" + activateYn + ", deleteYn=" + deleteYn + ", period=" + period + "]";
	}

	
	
}
