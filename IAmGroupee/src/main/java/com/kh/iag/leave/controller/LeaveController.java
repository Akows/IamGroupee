package com.kh.iag.leave.controller;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.iag.leave.entity.LvInfoDto;
import com.kh.iag.leave.entity.LvUsedListDto;
import com.kh.iag.leave.service.LeaveService;
import com.kh.iag.user.entity.UserDto;

@Controller
@RequestMapping("leave")
public class LeaveController {
	
	@Autowired
	private LeaveService service;
//============================= 사용자, 관리자 메뉴 =============================	
	@GetMapping("leaveMain")  // 연차 메인
	public String leaveMain(HttpSession session, HttpServletRequest request) {	
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		
		String enrollDate = String.valueOf(loginUser.getEnrollDate());
		LocalDate now = LocalDate.now();
		int year = now.getYear();
		String startDate = String.valueOf(year) + "-" + enrollDate.substring(5);
		
		session.setAttribute("startDate", startDate);
		
		return "leave/leaveMain";
	}
	
//	@GetMapping(value = {"/lvUsedList/{page}", "list"} , Model model, @PathVariable(required = false) String page)) // 연차 및 휴가 사용대장
	@GetMapping("lvUsedList")
	public String lvUsedList(HttpSession session, HttpServletRequest request) throws Exception {
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		String userNo = loginUser.getUserNo();
		
//		if (page == null) {
//			return "redirect:leave/lvUsedList/1";
//
//		}
//
//		//페이지vo생성 int currentPage, int cntPerPage, int pageBtnCnt, int totalRow
//		int cntPerPage = 5; // 한 페이지 당 10개씩 보여주기
//		int pageBtnCnt = 3; // 한 번에 보여줄 버튼 개수
//		int totalRow = service.getAlvRowCnt(userNo); // 디비에 있는 모든 데이터개수
//		PageVo pageVoAlv = new PageVo(page, cntPerPage, pageBtnCnt, totalRow);
		
		// 로그인한 사용자의 연차사용내역
		List<LvUsedListDto> alvUsedList =  service.getAlvList(userNo);
		if (alvUsedList != null) {
			
			for (LvUsedListDto al : alvUsedList) {
				String start = String.valueOf(al.getLvStart());
				String end =  String.valueOf(al.getLvEnd());
				al.setDuring(start + " ~ " + end);
			}
			request.setAttribute("alvUsedList", alvUsedList);
		}
		
		// 로그인한 사용자의 휴가사용내역
		List<LvUsedListDto> lvUsedList =  service.getLvList(userNo);
		if (lvUsedList != null) {
			for (LvUsedListDto al : lvUsedList) {
				String start = String.valueOf(al.getLvStart());
				String end =  String.valueOf(al.getLvEnd());
				al.setDuring(start + " ~ " + end);
			}
			request.setAttribute("lvUsedList", lvUsedList);
		}
		
		return "leave/lvUsedList";
	}
	
	@GetMapping("alvCal") // 연차 정산
	public String alvCal() {
		return "leave/alvCal";
	}

//============================= 사용자 메뉴 =============================	
	@GetMapping("lvInfo") // 사용자 휴무 정보 게시글
	public String lvInfo(HttpServletRequest request) throws Exception {
		
		List<LvInfoDto> lvInfoList = service.getLvInfoList();
		
		request.setAttribute("lvInfoList", lvInfoList);
		
		return "leave/leaveInfo";
	}
	
	@GetMapping("lvInfoDetail") // 사용자 휴무 정보 상세페이지
	public String lvInfoDetail() {
		
//		service.getLeaveList();
		
		
		return "leave/lvInfoDetail";
	}

	
	
	
}
