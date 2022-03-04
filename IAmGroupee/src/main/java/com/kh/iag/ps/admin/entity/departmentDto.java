package com.kh.iag.ps.admin.entity;

import lombok.Data;

@Data
public class departmentDto {
	private int departmentNo;
	private String departmentName;
	private int departmentLevel;
	private int topDepartmentNo;
}
