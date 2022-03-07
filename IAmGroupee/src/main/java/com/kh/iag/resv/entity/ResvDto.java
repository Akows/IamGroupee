package com.kh.iag.resv.entity;

import java.sql.Date;

import lombok.Data;
import lombok.Getter;

@Getter
@Data
public class ResvDto {
    
    private int resvNo;
	private String userNo;
	private int roomNo;
	private int assetNo;
	private String resvStart;
	private String resvEnd;
	private Date createDate;
	private Date ModDate;
	private String returnYn;
	private String deleteYn;
	
	private String roomName;
	private String assetName;
	
	private String period;
}
