package com.kh.iag.sch.entity;

import java.util.Date;

import lombok.Data;

@Data
public class SchDto {

	private int sch_num;
	private String user_no;
	private String sch_title;
	private Date sch_start;
	private Date sch_end;
	private String sch_my;
	private String sch_with;
	private String sch_place;
	private String sch_content;
}
