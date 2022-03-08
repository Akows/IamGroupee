package com.kh.iag.leave.entity;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class AlvOccurHistoryDto {
	private String userNo;
	private String lvCode;
	private String lvName;
	private int alvOccurCount;
	 @DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date alvOccurDate;
	private String alvOccurReason;
}
