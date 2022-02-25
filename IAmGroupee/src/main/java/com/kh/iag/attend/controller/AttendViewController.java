package com.kh.iag.attend.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.iag.attend.entity.AttendModDTO;
import com.kh.iag.attend.service.attendService;

@Controller
@RequestMapping("attend")
public class AttendViewController 
{
	@Autowired
	private attendService attendService;
	
	@GetMapping("attendview")
	public String attendView()
	{
		return "attend/attendview";
	}
	
	@PostMapping("attendmodify")
	public String attendModify(AttendModDTO attendmodDTO, HttpServletRequest req) throws Exception
	{
		System.out.println(attendmodDTO);
		
		int result = attendService.attendModify(attendmodDTO, req);

		if(result > 0) 
		{
			return "attend/attendview";
		}
		else 
		{
			return "attend/attendview";
		}

	}
}
