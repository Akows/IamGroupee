package com.kh.iag.chat.entity;

import lombok.Data;

@Data
public class ChatDto {

	private int chatId;
	private String fromId;
	private String toId;
	private String chatContent;
	private String chatTime;
	private String chatRead;
	
	private final int number = 100;
	private String listType;
	
	private String name; // 이름
	private long departmentNo; // 부서번호
	private String departmentName; // 부서명
	private long positionNo; // 직급 번호
	private String positionName; // 직급명
	private long positionLevel; // 직급 레벨
}
