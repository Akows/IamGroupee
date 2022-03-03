package com.kh.iag.resv.entity;

import java.sql.Date;
import lombok.Data;

@Data
public class ResvDto {
    
    private int resvNo;
	private int userNo;
	private int roomNo;
	private int equipNo;
	private Date resvStart;
	private Date resvEnd;
	private Date createDate;
	private Date ModDate;
	private String returnYn;
	
}
