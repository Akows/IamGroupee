package com.kh.iag.attend.entity;

import lombok.Data;

@Data
public class AttendDTO 
{
	private String attendancenumber;
	private String workdate;
	private String commutecheck;
	private String workcheck;
	private String commuteclass;
	private String changecheck;
	private String changereason;
	private String approvalcheck;
	private String workday;
}
