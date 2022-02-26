package com.kh.iag.ea.entity;

import lombok.Data;

@Data
public class FormDto {
	
	private int formNo;
	private String formTitle;
	private String formContent;
	private int formYears;
	private int categoryNo;
	private String categoryName;
}
