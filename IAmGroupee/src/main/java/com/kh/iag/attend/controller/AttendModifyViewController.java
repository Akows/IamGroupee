package com.kh.iag.attend.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.iag.attend.entity.AttendModDTO;
import com.kh.iag.attend.service.attendService;
import com.kh.iag.user.entity.UserDto;

@Controller
@RequestMapping("attend")
public class AttendModifyViewController 
{
	@Autowired
	private attendService service;
	
	@GetMapping("attendmodview")
	public String attendModView(Model model, HttpServletRequest req) throws Exception 
	{
		UserDto loginUser = (UserDto) req.getSession().getAttribute("loginUser");
		String userno = loginUser.getUserNo();
		
		AttendModDTO attendModDTO = new AttendModDTO();
		attendModDTO.setUser_no(userno);
		
		List<AttendModDTO> atModList = service.getMyModList(attendModDTO);
		model.addAttribute("atModList", atModList);
		
		return "attend/attendmodview";
	}
	
	@PostMapping(value = "attendmodviewsearch")
	public String attendModViewSearch(Model model, HttpServletRequest req, @RequestParam("searchKey") String searchValue) throws Exception
	{
		UserDto loginUser = (UserDto) req.getSession().getAttribute("loginUser");
		String userno = loginUser.getUserNo();
		
		AttendModDTO attendModDTO = new AttendModDTO();
		attendModDTO.setUser_no(userno);
		attendModDTO.setApprove_state(searchValue);
		
		System.out.println(userno);
		System.out.println(searchValue);
		
		List<AttendModDTO> attendModDTOList = service.getModListSearch(attendModDTO);
		
		model.addAttribute("atModList", attendModDTOList);
		
		for(AttendModDTO x : attendModDTOList) {
			System.out.println(x);
		}
		
		return "/attend/attendmodview";
	}

}
