package com.kh.iag.ps.admin.entitiy;

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
	private String pwd;	
	private String name;	
	private String residentNo;	
	private String phone;	
	private String email;	
	private String address;	
	private Date enrollDate;	
	private Date endDate;	
	private String activityYn;	
	private MultipartFile profile;	
	private String personnelRight;	
	private String paymentRight;	
	private String leaveRight;	
	private String reservationsRight;	
	private String boardRight;	
	private String attendenceRight;	
	private String salaryRight;	
	
	public void setEnrollDate(String enrollDate) {
		SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
	    Date date1 = null;
		try {
			date1 = sdf1.parse(enrollDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	    System.out.println(date1);
		this.enrollDate = date1;
	}

}




















