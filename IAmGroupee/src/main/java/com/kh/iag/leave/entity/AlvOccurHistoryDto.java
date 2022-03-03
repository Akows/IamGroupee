package com.kh.iag.leave.entity;

import java.sql.Date;

import lombok.Data;

@Data
public class AlvOccurHistoryDto {
	private String userNo;
	private String lvCode;
	private String lvName;
	private int alvOccurCount;
	private Date alvOccurDate;
	private String alvOccurReason;
}
