package com.kh.iag.attend.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.iag.attend.entity.AttendModDTO;
import com.kh.iag.attend.service.attendService;

@Controller
@RequestMapping("attend")
public class AttendModifyRejectController
{	
	@Autowired
	private attendService service;
	
	private int keyNum;

	@GetMapping("approvemanagenone")
	public String approveManageNone(Model model, HttpServletRequest req) throws Exception
	{
		String attend_mod_num = req.getParameter("attend_mod_num");
		
		keyNum = Integer.parseInt(attend_mod_num);

		return "attend/attendModReqDenialReason";
	}
	
	@PostMapping("approvemanagenoneprocess")
	public String approveManageNoneProcess(AttendModDTO attendModDTO) throws Exception
	{
		attendModDTO.setAttend_mod_num(keyNum);
		
		service.approveManageNone(attendModDTO);

		return "redirect:/attend/attendmanage";
	}
	
}
