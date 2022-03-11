package com.kh.iag.attend.controller;

import java.util.Iterator;
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
		AttendDTO attendDTO1 = new AttendDTO();
		AttendDTO attendDTO2 = new AttendDTO();
		AttendModDTO attendModDTO = new AttendModDTO();
		AttendWTDTO attendWTDTO1 = new AttendWTDTO();
		AttendWTDTO attendWTDTO2 = new AttendWTDTO();
		
		UserDto loginUser = (UserDto) req.getSession().getAttribute("loginUser");
		String userno = loginUser.getUserNo();
		String username = loginUser.getName();
		
		attendDTO1.setUser_no(userno);
		attendDTO2.setUser_no(userno);
		attendDTO2.setUser_name(username);
		attendModDTO.setUser_no(userno);
		attendWTDTO1.setUser_no(userno);
		attendWTDTO2.setUser_no(userno);

		List<AttendDTO> attendList1 = service.getAttendInfo(attendDTO1);
		List<AttendDTO> attendList2 = service.getAttendNumandName(attendDTO2);
		List<AttendModDTO> attendModinfo = service.getAttendModInfo(attendModDTO);
		List<AttendWTDTO> attendWTList1 = service.getAttendWTInfo(attendWTDTO1);
		
		List<AttendWTDTO> attendWTList2 = service.getWTTWTInfo(attendWTDTO2);
		
		model.addAttribute("atInfo", attendList1);
		model.addAttribute("atInfo2", attendList2);
		model.addAttribute("atModInfo", attendModinfo);
		model.addAttribute("atWTInfo", attendWTList1);
		model.addAttribute("atWTInfo2", attendWTList2);
		
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
	
	@PostMapping("attendprocessrein")
	public String attendprocessReIN(AttendWTDTO attendWTDTO, HttpServletRequest req) throws Exception
	{
		service.attendprocessReIN(attendWTDTO, req);
		
		return "redirect:/attend/attendmain";
	}
	
	@PostMapping("attendprocessreout")
	public String attendprocessReOUT(AttendWTDTO attendWTDTO, HttpServletRequest req) throws Exception
	{
		service.attendprocessReOUT(attendWTDTO, req);
		
		return "redirect:/attend/attendmain";
	}
}





















