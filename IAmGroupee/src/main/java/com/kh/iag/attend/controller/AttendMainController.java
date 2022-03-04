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
		AttendDTO attendDTO = new AttendDTO();
		AttendModDTO attendModDTO = new AttendModDTO();
		AttendWTDTO attendWTDTO = new AttendWTDTO();
		
		UserDto loginUser = (UserDto) req.getSession().getAttribute("loginUser");
		String userno = loginUser.getUserNo();
		
		attendDTO.setUser_no(userno);
		attendModDTO.setUser_no(userno);
		attendWTDTO.setUser_no(userno);
		
		List<AttendDTO> attendList = service.getAttendInfo(attendDTO);
		List<AttendModDTO> attendModList = service.getAttendModInfo(attendModDTO);
		List<AttendWTDTO> attendWTList = service.getAttendWTInfo(attendWTDTO);
		
		System.out.println(attendList);
		System.out.println(attendModList);
		System.out.println(attendWTList);

		model.addAttribute("atInfo", attendList);
		model.addAttribute("atModnfo", attendModList);
		model.addAttribute("atWTInfo", attendWTList);
		
		return "attend/attendmain";
	}
	
	@PostMapping("attendprocessin")
	public String attendprocessIN(AttendWTDTO attendWTDTO, HttpServletRequest req) throws Exception
	{
		UserDto loginUser = (UserDto) req.getSession().getAttribute("loginUser");
		String userno = loginUser.getUserNo();
		attendWTDTO.setUser_no(userno);
		
		int result = service.attendprocessIN(attendWTDTO, req);
		
		if(result > 0) 
		{
			return "attend/attendmain";
		}
		else 
		{
			return "attend/attendmain";
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	@PostMapping("attendprocessout")
	public String attendprocessOUT(AttendWTDTO attendWTDTO, HttpServletRequest req) throws Exception
	{
		UserDto loginUser = (UserDto) req.getSession().getAttribute("loginUser");
		String userno = loginUser.getUserNo();
		attendWTDTO.setUser_no(userno);
		
		service.attendprocessOUT(attendWTDTO, req);
		
		return "attend/attendmain";
	}
}





















