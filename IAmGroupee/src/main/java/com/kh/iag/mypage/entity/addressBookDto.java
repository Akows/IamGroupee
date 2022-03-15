package com.kh.iag.mypage.entity;

import java.util.List;

import com.kh.iag.ps.admin.entity.UserDto;

import lombok.Data;

@Data
public class addressBookDto {
	private int addressNo;
	private String addressName;
	private List<UserDto> userList;
	private String[] user;
	private String userNo;
}
