package com.kh.iag.ea.admin.controller;

import java.net.URLEncoder;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	// 양식관리 카테고리/양식 추가, 삭제
	@GetMapping(value = "/insertCategory")
	@ResponseBody
	public String insertCategory() throws Exception {
		// 양식 카테고리 추가
		int result = service.insertFormCategory();
		CategoryDto dto = null;
		if(result > 0)
			dto = service.selecLatestFormCategory();
		
		String formNo = String.valueOf(dto.getCategoryNo());
		return formNo;
	}
	@GetMapping(value = "/deleteCategory")
	@ResponseBody
	public String deleteCategory(String categoryNo) throws Exception {
		// 양식 카테고리 삭제
		int result = service.deleteFormCategory(categoryNo);
		System.out.println(result);
		
		return categoryNo;
	}
	@GetMapping(value = "/insertForm")
	@ResponseBody
	public String insertForm(String categoryNo) throws Exception {
		// 양식 추가
		int result = service.insertForm(categoryNo);
		FormDto dto = null;
		if(result > 0)
			dto = service.selecLatestForm();
			
		String formNo = String.valueOf(dto.getFormNo());
		return formNo;
	}
	@GetMapping(value = "/deleteForm")
	@ResponseBody
	public String deleteForm(String formNo) throws Exception {
		// 양식 삭제
		int result = service.deleteForm(formNo);
		System.out.println(result);
		
		return formNo;
	}
	
	// 양식 수정 페이지
	@GetMapping(value = "/editform")
	public String editForm() {
		return "ea/admin/ea_admin_editForm";
	}
}
