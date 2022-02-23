package com.kh.iag.board.entity;

import lombok.Data;

@Data
public class FreeBoardDto {

	private int boardFreeNum;
	private String userNo;
	private int deptNum;
	private int positionNum;
	private int taskNum;
	private String boardFreeWriter;
	private String boardFreeTitle;
	private String boardFreeContent;
}
