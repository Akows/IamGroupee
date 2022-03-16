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
	
//	@RequestMapping(value = "attendModReqForm", method = RequestMethod.POST)
//	public String attendModReqForm(AttendModDTO attendmodDTO, HttpServletRequest req, Model model) throws Exception
//	{
//		String key = req.getParameter("attend_date");
//		
//		model.addAttribute("keyvalue", key);
//		
//		System.out.println("KEY!!!!! : " + key);
//		
//		return "attend/attendModReqForm";
//	}

	
	@RequestMapping(value = "attendstate/attendmodify", method = RequestMethod.POST)
	public String attendModifyReq(AttendModDTO attendmodDTO, HttpServletRequest req, MultipartFile file, Model model) throws Exception
	{
		UserDto loginUser = (UserDto) req.getSession().getAttribute("loginUser");
		String userno = loginUser.getUserNo();
		String userName = loginUser.getName();
		
		attendmodDTO.setUser_no(userno);
		attendmodDTO.setUser_name(userName);
		
		String attend_date = req.getParameter("modify_req_date");
		int resultCheck = service.checkModReq(attend_date);
		
		String workcheck = String.valueOf(service.getWorkCheck(attend_date));
		
		System.out.println("attend_date : " + attend_date);
		System.out.println("workcheck : " + workcheck);
		
		if (resultCheck == 0)
		{
			if (workcheck == "정상퇴근")
			{
				return "redirect:/attend/attendstate";
			}
			else if (workcheck == "초과근무퇴근") 
			{
				return "redirect:/attend/attendstate";
			}
			else
			{
				service.attendModify(attendmodDTO, req, file);
				return "redirect:/attend/attendstate";
			}
		}
		else
		{
			return "redirect:/attend/attendstate";
		}
	}
}
