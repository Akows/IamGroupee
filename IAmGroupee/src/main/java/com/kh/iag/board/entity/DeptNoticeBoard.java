package com.kh.iag.board.entity;

import lombok.Data;

@Data
public class DeptNoticeBoard {

	private int deptNoticeNum;
	private String userNo;
	private int deptNo;
	private String deptNoticeWriter;
	private String noticeTitle;
	private String noticeContent;
}
