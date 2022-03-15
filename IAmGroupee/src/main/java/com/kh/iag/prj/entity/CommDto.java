package com.kh.iag.prj.entity;

import lombok.Data;

@Data
public class CommDto {
	
	private int commNo;
	private int reportNo;
	private String userNo;
	private String content;
	private String createDate;
	private String modDate;
	private String modYn;
	private String deleteYn;
	@Override
	public String toString() {
		return "CommDto [commNo=" + commNo + ", reportNo=" + reportNo + ", userNo=" + userNo + ", content=" + content
				+ ", createDate=" + createDate + ", modDate=" + modDate + ", modYn=" + modYn + ", deleteYn=" + deleteYn
				+ "]";
	}
	
	

	
}