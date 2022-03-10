package com.kh.iag.attend.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.iag.attend.entity.AttendDTO;
import com.kh.iag.attend.entity.AttendModDTO;
import com.kh.iag.attend.entity.AttendWTDTO;
import com.kh.iag.attend.service.attendService;
import com.kh.iag.user.entity.UserDto;

@Controller
@RequestMapping("attend")
public class AttendViewController 
{
	@Autowired
	private attendService service;
	
	@GetMapping("attendview")
	public String attendView(Model model, HttpServletRequest req) throws Exception
	{
		AttendDTO attendDTO = new AttendDTO();
		
		UserDto loginUser = (UserDto) req.getSession().getAttribute("loginUser");
		String userNo = loginUser.getUserNo();
		
		attendDTO.setUser_no(userNo);

		List<AttendDTO> ATList = service.getAllAttendINfo(attendDTO);

		model.addAttribute("ATInfo", ATList);
		
		return "attend/attendview";
	}
	
	@PostMapping("attendmodify")
	public String attendModify(AttendModDTO attendmodDTO, HttpServletRequest req, MultipartFile file) throws Exception
	{
		UserDto loginUser = (UserDto) req.getSession().getAttribute("loginUser");
		String userno = loginUser.getUserNo();
		String userName = loginUser.getName();
		
		attendmodDTO.setUser_no(userno);
		attendmodDTO.setUser_name(userName);
	
		int result = service.attendModify(attendmodDTO, req, file);

		if(result > 0) 
		{
			return "redirect:/attend/attendstate";
		}
		else 
		{
			return "redirect:/attend/attendstate";
		}
	}
	
}
