package com.kh.iag.prj.entity;

import java.sql.Date;
import lombok.Data;

@Data
public class PrjDto {

	private long prjNo;
	private long userNo;
	private String prjName;
//	private String departNo;
	private Date createDate;
	private String openYn;
	private String activeYn;
	private String deleteYn;
}
