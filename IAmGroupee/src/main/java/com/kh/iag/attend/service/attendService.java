package com.kh.iag.attend.service;

import javax.servlet.http.HttpServletRequest;

import com.kh.iag.attend.entity.AttendModDTO;

public interface attendService 
{
	int attendModify(AttendModDTO attendmodDTO, HttpServletRequest req) throws Exception;
}
