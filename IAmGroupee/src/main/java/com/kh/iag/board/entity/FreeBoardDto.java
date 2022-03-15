package com.kh.iag.board.entity;

import java.sql.Date;

import lombok.Data;

@Data
public class FreeBoardDto {

	private int boardFreeNum;
	private String userNo;
	private String freeTitle;
	private String freeContent;
	private Date freeDate;
	private int freeViewCount;
}
