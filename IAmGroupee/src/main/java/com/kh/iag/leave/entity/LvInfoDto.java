package com.kh.iag.leave.entity;

import java.sql.Date;

import lombok.Data;

@Data
public class LvInfoDto {
	private int lvbNo;
	private String lvbTitle;
	private String lvbWriter;
	private String lvbContent;
	private String lvbDel;
	private Date lvbDate;
	private String lvbFile;	
}
