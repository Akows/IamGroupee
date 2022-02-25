package com.kh.iag.ea.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.iag.ea.admin.service.AdminEAService;
import com.kh.iag.ea.entity.PositionDto;
import com.kh.iag.ea.entity.SettingsDto;

@Controller
@RequestMapping(value = "admin/ea")
public class AdminEAController {
	
	@Autowired
	private AdminEAService service;
	
	// 전자결재 관리자 메인 페이지
	@GetMapping(value = "/main")
	public String main(Model model) throws Exception {
		// 기본설정 데이터
		SettingsDto defaultSettings = service.defaultSettings();
		model.addAttribute("defaultSettings", defaultSettings);
		// 직위 데이터
		List<PositionDto> positionValues = service.positionValues();
		model.addAttribute("positionValues", positionValues);
		
		return "ea/admin/ea_admin_main";
	}
	
	// 양식 수정 페이지
	@GetMapping(value = "/editform")
	public String editForm() {
		return "ea/admin/ea_admin_editForm";
	}
}
