package com.kh.iag.user.entity;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class UserDto {
	private String userNo;
	private long positionNo;
	private long departmentNo;
	private long jobNo;
	private String pwd;	
	private String name;	
	private String residentNo;	
	private String phone;	
	private String email;	
	private String address;	
	private Date enrollDate;	
	private Date endDate;	
	private String activityYn;	
	private String profile;	
	private int alvCount;	
	private int alvUsedCount;	
	private int alvLeftCount;	
	private String personnelRight;	
	private String paymentRight;	
	private String leaveRight;	
	private String reservationsRight;	
	private String boardRight;	
	private String attendenceRight;	
	private String salaryRight;	
	private String sessionKey;	
	private Timestamp sessionLimit;	
}




















