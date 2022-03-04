package com.kh.iag.sch.entity;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Data;

@Data
public class SchDto {

	private int schNum;
	private String userNo;
	private String schAllDay;
	private String schTitle;
	private Timestamp schStart;
	private Timestamp schEnd;
	private String schType;
	private String schColor;
	private String schContent;
	
}
