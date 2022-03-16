package com.kh.iag.prj.entity;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FileDto {

	private int fileNo;
	private int prjNo;
	private String changeName;
	
	private MultipartFile f;
	
}
