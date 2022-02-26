package com.kh.iag.ea.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.iag.ea.admin.service.AdminEAService;
import com.kh.iag.ea.entity.CategoryDto;
import com.kh.iag.ea.entity.FormDto;
import com.kh.iag.ea.entity.PositionDto;
import com.kh.iag.ea.entity.SettingsDto;

@Controller
@RequestMapping(value = "admin/ea")
public class AdminEAController {
	
	@Autowired
	private AdminEAService service;
	
	// 전자결재 관리자 메인 페이지
	@GetMapping(value = "/main")
	public String main(@ModelAttribute SettingsDto dto, Model model) throws Exception {
		// 설정 업데이트
		if(dto.getSecMinA() > 0) {
			service.updateSettings1(dto);
			service.updateSettings2(dto);
			service.updateSettings3(dto);
		}
		// 기본설정 데이터
		SettingsDto defaultSettings = service.defaultSettings();
		model.addAttribute("defaultSettings", defaultSettings);
		// 직위 데이터
		List<PositionDto> positionValues = service.positionValues();
		model.addAttribute("positionValues", positionValues);
		// 양식 카테고리 데이터
		List<CategoryDto> categoryValues = service.categoryValues();
		model.addAttribute("categoryValues", categoryValues);
		// 양식 데이터
		List<FormDto> formValues = service.formValues();
		model.addAttribute("formValues", formValues);
		
		return "ea/admin/ea_admin_main";
	}
	
	// 양식 수정 페이지
	@GetMapping(value = "/editform")
	public String editForm() {
		return "ea/admin/ea_admin_editForm";
	}
}
