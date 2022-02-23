package com.kh.iag.board.entity;

import lombok.Data;

@Data
public class DeptNoticeBoardDto {

	private int deptNoticeNum;
	private String userNo;
	private int deptNo;
	private String deptNoticeWriter;
	private String deptNoticeTitle;
	private String deptNoticeContent;
}
