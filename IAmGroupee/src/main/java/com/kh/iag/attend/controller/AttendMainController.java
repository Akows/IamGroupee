package com.kh.iag.attend.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.iag.attend.entity.AttendDTO;
import com.kh.iag.attend.entity.AttendModDTO;
import com.kh.iag.attend.entity.AttendWTDTO;
import com.kh.iag.attend.service.attendService;
import com.kh.iag.user.entity.UserDto;

@Controller
@RequestMapping("attend")
public class AttendMainController 
{
	@Autowired
	private attendService service;
	
	
	@GetMapping("attendmain")
	public String attendMain()
	{
		return "attend/attendmain";
	}

	@PostMapping("attendmain")
	public String attendMainPage(Model model, HttpServletRequest req) throws Exception
	{
		AttendDTO tt = new AttendDTO();
		AttendModDTO t1 = new AttendModDTO();
		AttendWTDTO t2 = new AttendWTDTO();
		
		UserDto loginUser = (UserDto) req.getSession().getAttribute("loginUser");
		String userno = loginUser.getUserNo();
		
		tt.setUser_no(userno);
		t1.setUser_no(userno);
		t2.setUser_no(userno);
		
		List<AttendDTO> attendList = service.getAttendInfo();
		List<AttendModDTO> attendModList = service.getAttendModInfo();
		List<AttendWTDTO> attendWTList = service.getAttendWTInfo();

		model.addAttribute("atInfo", attendList);
		model.addAttribute("atInfo", attendModList);
		model.addAttribute("atInfo", attendWTList);
		
		return "attend/attendmain";
	}
}
