package com.kh.iag.attend.entity;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class AttendModDTO 
{
	private long attend_mod_num;
	private String user_no;
	private String user_name;
	private String req_date;
	private String modify_req_date;
	private String mod_reason;
	private String reject_reason;
	private String attach_file;
	private long attach_file_size;
	private String approve_state;
	private MultipartFile file;
}