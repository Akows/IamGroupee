package com.kh.iag.sch.entity;

import java.util.Date;

import lombok.Data;

@Data
public class SchDto {

	private int schNum;
	private String schTitle;
	private Date schStart;
	private Date schEnd;
	private String schWith;
	private String schCategory;
	private String schContent;
}
