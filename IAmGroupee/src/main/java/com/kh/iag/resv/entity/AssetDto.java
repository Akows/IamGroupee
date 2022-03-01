package com.kh.iag.resv.entity;

import java.sql.Date;

import lombok.Data;

@Data
public class AssetDto {
	
	private int assetNo;
	private String assetName;
	private String activateYn;
	private Date createDate;
	private Date modDate;
	private String deleteYn;
	
	
}
