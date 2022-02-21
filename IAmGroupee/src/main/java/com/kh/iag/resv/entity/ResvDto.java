package com.kh.iag.resv.entity;

import java.sql.Date;
import lombok.Data;

@Data
public class ResvDto {
    
    private long resvNo;
	private long userNo;
	private long roomNo;
	private long equipNo;
	private Date resvStart;
	private Date resvEnd;
	private Date createDate;
	private Date ModDate;
	private String returnYn;
	
	

}
