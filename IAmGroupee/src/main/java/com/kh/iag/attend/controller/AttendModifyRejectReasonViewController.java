package com.kh.iag.attend.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.iag.attend.entity.AttendModDTO;
import com.kh.iag.attend.service.attendService;

@Controller
@RequestMapping("attend")
public class AttendModifyRejectReasonViewController 
{
	@Autowired
	private attendService service;
	
	@GetMapping("rejectreasonview")
	public String rejectReasonView(Model model, HttpServletRequest req) throws Exception
	{ 
		String attend_mod_num = req.getParameter("attend_mod_num");
		
		List<AttendModDTO> attendModDTOList = service.getrejectReason(attend_mod_num);
		
		model.addAttribute("getRReason", attendModDTOList);

		return "attend/attendModRejectView";
	}
}
