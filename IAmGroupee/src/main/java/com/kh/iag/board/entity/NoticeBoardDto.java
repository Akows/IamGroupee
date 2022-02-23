package com.kh.iag.board.entity;

import lombok.Data;

@Data
public class NoticeBoardDto {

	private int noticeNum;
	private String userNo;
	private String noticeWriter;
	private String noticeTitle;
	private String noticeContent;
}
