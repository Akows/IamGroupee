package com.kh.iag.resv.entity;

import java.sql.Date;

import lombok.Data;

@Data
public class RoomDto {
	
	private int roomNo;
	private String roomName;
	private String activateYn;
	private Date createDate;
	private Date modDate;
	private String deleteYn;
	
	
}
