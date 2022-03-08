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
	
	@GetMapping("attendtempdateinsert")
	public String attendtempdateinsert(Model model, HttpServletRequest req) throws Exception
	{
		AttendDTO attendDTO = new AttendDTO();
		AttendWTDTO attendWTDTO = new AttendWTDTO();
		
		UserDto loginUser = (UserDto) req.getSession().getAttribute("loginUser");
		
		String userNo = loginUser.getUserNo();
		String userName = loginUser.getName();
		
		attendDTO.setUser_no(userNo);
		attendDTO.setUser_name(userName);
		attendWTDTO.setUser_no(userNo);

		service.attendtempdatainsert(attendDTO);
		service.attendWTtempdatainsert(attendWTDTO);
		
		return "redirect:/attend/attendmain";
	}
	
	@GetMapping("attendmain")
	public String attendMain(Model model, HttpServletRequest req) throws Exception
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
		List<AttendModDTO> attendModinfo = service.getAttendModInfo(attendModDTO);
		List<AttendWTDTO> attendWTList = service.getAttendWTInfo(attendWTDTO);
		
		List<AttendDTO> preAttendList = service.getPreAttendInfo(attendDTO);
		
		model.addAttribute("preAtInfo", preAttendList);
		
		model.addAttribute("atInfo", attendList);
		model.addAttribute("atModInfo", attendModinfo);
		model.addAttribute("atWTInfo", attendWTList);
		
		return "attend/attendmain";
	}

	@PostMapping("attendprocessin")
	public String attendprocessIN(AttendWTDTO attendWTDTO, HttpServletRequest req) throws Exception
	{
		service.attendprocessIN(attendWTDTO, req);
		
		return "redirect:/attend/attendmain";
		
	}
	
	@PostMapping("attendprocessout")
	public String attendprocessOUT(AttendWTDTO attendWTDTO, HttpServletRequest req) throws Exception
	{
		service.attendprocessOUT(attendWTDTO, req);
		
		return "redirect:/attend/attendmain";
	}
}





















