package com.kh.iag.ps.admin.entity;

import lombok.Data;

@Data
public class departmentDto {
	private int departmentNo;
	private String departmentName;
	private int topDepartment;
	private int rootDepartment; //뿌리 부서
	private int leaf; // 하위 부서 존재 여부
	private int level; // 부서 레벨
}
