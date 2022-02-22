package com.kh.iag.board.entity;

import lombok.Data;

@Data
public class NoticeBoardDto {

	private int notice_num;
	private String user_no;
	private String notice_writer;
	private String notice_title;
	private String notice_content;
}
