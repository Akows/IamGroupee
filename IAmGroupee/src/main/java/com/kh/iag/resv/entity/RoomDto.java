package com.kh.iag.resv.entity;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class RoomDto {
	
	private int roomNo;
	private String roomName;
	private String activateYn;
	private String deleteYn;
	
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date createDate;
	
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date modDate;
	
	
	
}
