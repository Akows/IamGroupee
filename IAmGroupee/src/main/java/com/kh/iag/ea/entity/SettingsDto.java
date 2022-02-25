package com.kh.iag.ea.entity;

import lombok.Data;

@Data
public class SettingsDto {
	// 문서보안A
	private String secGradeA;
	private int secMinA;
	// 문서보안A
	private String secGradeB;
	private int secMinB;
	// 문서포맷
	private int formatNo;
	private String formatYear;
	private String formatDept;
	private String formatForm;
}
