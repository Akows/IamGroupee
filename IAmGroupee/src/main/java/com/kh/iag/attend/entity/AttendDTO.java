package com.kh.iag.attend.entity;

import lombok.Data;

@Data
public class AttendDTO 
{
	private String attend_num;
	private String user_no;
	private String user_name;
	private String attend_date;
	private String normal_check;
	private String irregular_reason;
	private String work_numofdate;	
}
