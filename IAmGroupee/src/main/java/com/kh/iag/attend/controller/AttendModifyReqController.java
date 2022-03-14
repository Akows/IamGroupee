package com.kh.iag.attend.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.kh.iag.attend.entity.AttendModDTO;
import com.kh.iag.attend.service.attendService;
import com.kh.iag.user.entity.UserDto;

@RequestMapping(value = "attend")
@Controller
public class AttendModifyReqController 
{
	@Autowired
	private attendService service;
	
	@RequestMapping(value = "attendModReqForm", method = RequestMethod.GET)
	public String attendModReqForm(AttendModDTO attendmodDTO, HttpServletRequest req, Model model) throws Exception
	{
		String keyVaule = req.getParameter("attend_date");
		
		return "attend/attendModReqForm";
	}

	
	@RequestMapping(value = "attendstate/attendmodify", method = RequestMethod.POST)
	public String attendModifyReq(AttendModDTO attendmodDTO, HttpServletRequest req, MultipartFile file) throws Exception
	{
		UserDto loginUser = (UserDto) req.getSession().getAttribute("loginUser");
		String userno = loginUser.getUserNo();
		String userName = loginUser.getName();
		
		attendmodDTO.setUser_no(userno);
		attendmodDTO.setUser_name(userName);
		
		int result = service.attendModify(attendmodDTO, req, file);
		
		if (result > 0)
		{
			return "redirect:/attend/attendstate";
		}
		else
		{
			return "redirect:/attend/attendstate";
		}

	}

}
