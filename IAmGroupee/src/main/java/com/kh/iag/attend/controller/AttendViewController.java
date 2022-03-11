package com.kh.iag.attend.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.iag.attend.entity.AttendDTO;
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

}
