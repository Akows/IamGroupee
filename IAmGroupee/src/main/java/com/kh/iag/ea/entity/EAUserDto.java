package com.kh.iag.ea.entity;

import lombok.Data;

@Data
public class EAUserDto {
//	ACTIVITY_YN = 'Y'
	private String userNo; // 사번
	private String name; // 이름
	private long departmentNo; // 부서번호
	private String departmentName; // 부서명
	private long positionNo; // 직급 번호
	private String positionName; // 직급명
	private long positionLevel; // 직급 레벨
}
