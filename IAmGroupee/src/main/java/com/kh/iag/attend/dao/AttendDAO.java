package com.kh.iag.attend.dao;

import com.kh.iag.attend.entity.AttendModDTO;

public interface AttendDAO 
{
	int getAttendmodSeq() throws Exception;

	int insertattendmodify(AttendModDTO attendmodDTO) throws Exception;

	void uploadfile(AttendModDTO attendmodDTO) throws Exception;

}
