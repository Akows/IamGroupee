package com.kh.iag.resv.entity;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class RoomDto {
	
	private int roomNo;
	private String roomName;
	
	private String activateYn;  //활성화 'Y'일때, 예약가능 
	private String deleteYn;
	private String detail;
	private String reserved; // 예약됨 'Y' 일때) 삭제, 변경 불가능 
	
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date createDate;
	
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date modDate;
	
	
}
