package com.kh.iag.ps.admin.entity;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class UserDto {
	private String userNo;
	private long positionNo;
	private long departmentNo;
	private long jobNo;
	private String departmentName;
	private String positionName;
	private String jobName;
	private String pwd;	
	private String name;	
	private String residentNo;	
	private String phone;	
	private String email;	
	private String address;	
	private String enrollDateStr;
	private String endDateStr;
	private Date enrollDate;	
	private Date endDate;	
	private String activityYn;	
	private String profile;
	private MultipartFile file;	
	private String personnelRight = "N";	
	private String paymentRight = "N";	
	private String leaveRight = "N";	
	private String reservationsRight = "N";	
	private String boardRight = "N";	
	private String attendenceRight = "N";
	private String salaryRight = "N";
	
	public void setEnrollDateStr(String enrollDateStr) {
		this.enrollDateStr = enrollDateStr;
		SimpleDateFormat sdf1 = new SimpleDateFormat("MM/dd/yyyy");
	    Date date1 = null;
		try {
			date1 = sdf1.parse(enrollDateStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		this.enrollDate = date1;
	}
	
	public void setEndDateStr(String endDateStr) {
		if (endDateStr == null || endDateStr =="") {
			
		} else {
			this.endDateStr = endDateStr;
			SimpleDateFormat sdf1 = new SimpleDateFormat("MM/dd/yyyy");
		    Date date1 = null;
			try {
				date1 = sdf1.parse(endDateStr);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			this.endDate = date1;
		}

	}
	
	public String enrollDateToString() {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
		String Date = simpleDateFormat.format(enrollDate);

		return Date;
	}
	
	public String endDateToString() {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
		String Date = simpleDateFormat.format(endDate);

		return Date;
	}
	
	public String enrollDateModi() {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy"); 
		String Date = simpleDateFormat.format(enrollDate);

		return Date;
	}
	
	public String endDateModi() {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy"); 
		String Date = simpleDateFormat.format(endDate);

		return Date;
	}

}




















