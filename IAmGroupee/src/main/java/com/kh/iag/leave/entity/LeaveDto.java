package com.kh.iag.leave.entity;

import lombok.Data;

@Data
public class LeaveDto {
	private String lvCode;
	private String lvName;
	private String lvPaid;
	private float alvReduce;
	private int whReduce;
	private String lvContent;
}
