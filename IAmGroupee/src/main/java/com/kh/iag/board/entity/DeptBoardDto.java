package com.kh.iag.board.entity;

import lombok.Data;

@Data
public class DeptBoardDto {

	private int boardDeptNum;
	private String userNo;
	private int deptNum;
	private int positionNum;
	private String boardDeptWriter;
	private String boardDeptTitle;
	private String boardDeptContent;
}
