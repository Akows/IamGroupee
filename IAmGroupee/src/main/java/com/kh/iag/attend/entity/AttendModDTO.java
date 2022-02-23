package com.kh.iag.attend.entity;

import lombok.Data;

@Data
public class AttendModDTO 
{
	private long attend_mod_num;
	private String attend_num;
	private String req_date;
	private String mod_reason;
	private String attach_file;
	private String approve_state;
}
