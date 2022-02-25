package com.kh.iag.leave.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.iag.leave.entity.LeaveDto;
import com.kh.iag.leave.entity.LvInfoDto;
import com.kh.iag.leave.service.LeaveService;

@Controller
@RequestMapping("admin/leave")
public class AdminLeaveController {
	
	@Autowired
	private LeaveService service;	
	
//============================= 관리자 메뉴 =============================	
	
	@GetMapping("main") // 관리 메인
	public String main() {
		return "leave/lvAdmin/adminLeaveMain";
	}
	
	@GetMapping("usAlvAD") // 사원 연차 관리 (JSP없음)
	public String usAlvAD() {
		return "leave/lvAdmin/usAlvAD";
	}
	
	@GetMapping("lvModiAD") // 휴가 발생 관리
	public String lvModiAD(HttpServletRequest request) throws Exception {
		List<LeaveDto> lvTypeList = service.getLvTypeList();
		request.setAttribute("lvTypeList", lvTypeList);
		return "leave/lvAdmin/lvModiAD";
	}
	
	@PostMapping("lvAddAD") // 휴가 추가
	public String lvAddAD(HttpServletRequest request, LeaveDto leaveDto, RedirectAttributes attributes) throws Exception {
		// 입력한 휴가 코드가 존재하는 지 확인
		LeaveDto checkExist = service.checkExist(leaveDto);
		if (checkExist != null) {
			attributes.addFlashAttribute("checkExist", checkExist.getLvCode());
			return "redirect:/admin/leave/lvModiAD";
		}else {
			int result = service.addLvType(leaveDto);
			if (result > 0) {
				return "redirect:/admin/leave/lvModiAD";
			} return "redirect:/admin/leave/lvModiAD";
		}
	}
	
	@PostMapping("lvDelAD") // 휴가 삭제
	public String lvDelAD(HttpServletRequest request, String result) throws Exception {
		String[] delArr = result.split(",");
		for (String lvCode : delArr) {
			service.delLvType(lvCode);
		}
		return "redirect:/leave/lvAdmin/lvModiAD";
	}
	
	@GetMapping("lvInfoAD") // 휴무 정보 게시글
	public String lvInfoAD(HttpServletRequest request) throws Exception {
		List<LvInfoDto> lvInfoList = service.getLvInfoList();
		
		request.setAttribute("lvInfoList", lvInfoList);
		
		return "leave/lvAdmin/lvInfoAD";
	}
	@GetMapping("lvInfoWriteAD") // 휴무 정보 게시글 작성
	public String lvInfoWriteAD() {
		return "leave/lvAdmin/lvInfoWriteAD";
	}
	
	@GetMapping("alvIntendAD") // 연차 사용 촉구서 (JSP없음)
	public String alvIntendAD() {
		return "leave/lvAdmin/alvIntendAD";
	}
	
}
