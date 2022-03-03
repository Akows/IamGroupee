package com.kh.iag.leave.controller;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.iag.leave.entity.AlvOccurHistoryDto;
import com.kh.iag.leave.entity.LvInfoDto;
import com.kh.iag.leave.entity.LvUsedListDto;
import com.kh.iag.leave.entity.PageVo;
import com.kh.iag.leave.service.LeaveService;
import com.kh.iag.user.entity.UserDto;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("leave")
@Slf4j
public class LeaveController {
	
	@Autowired
	private LeaveService service;
//============================= 사용자, 관리자 메뉴 =============================	
	@GetMapping("leaveMain")  // 연차 메인
	public String leaveMain(HttpSession session, Model model) throws Exception {	
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		
		String enrollDate = String.valueOf(loginUser.getEnrollDate());
		LocalDate now = LocalDate.now();
		int year = now.getYear();
		String startDate = String.valueOf(year) + "-" + enrollDate.substring(5);
		
		String userNo = loginUser.getUserNo();
//		사용내역
		List<LvUsedListDto> allUsedList =  service.getAllUsage(userNo);
		for (LvUsedListDto allUsedLv : allUsedList) {
			Date startLv = allUsedLv.getLvStart();
			Date endLv = allUsedLv.getLvStart();
			String duringLv = startLv + " ~ " + endLv;
			allUsedLv.setDuring(duringLv);
		}
//		발생내역
		List<AlvOccurHistoryDto> lvHistoryList = service.getOccurHistory(userNo);

		session.setAttribute("startDate", startDate);
		model.addAttribute("allUsedList", allUsedList);
		model.addAttribute("lvHistoryList", lvHistoryList);
		
		return "leave/leaveMain";
	}
	
	@GetMapping("AllLvUsedList") // 연차 및 휴가 사용대장
	public String lvUsedList(HttpSession session, Model model) throws Exception {
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		String userNo = loginUser.getUserNo();
		
		// 로그인한 사용자의 연차사용내역
		List<LvUsedListDto> alvUsedList = service.getAlvListCalen(userNo);
		if (alvUsedList != null) {
			
			for (LvUsedListDto al : alvUsedList) {
				String start = String.valueOf(al.getLvStart());
				String end =  String.valueOf(al.getLvEnd());
				al.setDuring(start + " ~ " + end);
			}
			model.addAttribute("alvUsedList", alvUsedList);
		}
		
		// 로그인한 사용자의 휴가사용내역
		List<LvUsedListDto> lvUsedList =  service.getLvListCalen(userNo);
		if (lvUsedList != null) {
			for (LvUsedListDto al : lvUsedList) {
				String start = String.valueOf(al.getLvStart());
				String end =  String.valueOf(al.getLvEnd());
				al.setDuring(start + " ~ " + end);
			}
			model.addAttribute("lvUsedList", lvUsedList);
		}
		
		return "leave/lvUsedList";
	}
	
	// 로그인한 사용자의 연차사용내역
	@GetMapping(value = {"/alvUsedListIf/{page}", "alvUsedListIf"} )
	public String alvUsedList(HttpSession session, Model model, @PathVariable(required = false) String page) throws Exception {
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		String userNo = loginUser.getUserNo();
		if (page == null) {
			return "redirect:alvUsedListIf/1";

		}

		//페이지vo생성 int currentPage, int cntPerPage, int pageBtnCnt, int totalRow
		int cntPerPage = 4; // 한 페이지 당 14개씩 보여주기
		int pageBtnCnt = 3; // 한 번에 보여줄 버튼 개수
		int totalAlvRow = service.getAlvRowCnt(userNo); // 디비에 있는 모든 연차사용내역 데이터개수
		PageVo pageVoAlv = new PageVo(page, cntPerPage, pageBtnCnt, totalAlvRow);
		System.out.println("연차" + pageVoAlv);
			
		// 로그인한 사용자의 연차사용내역
		List<LvUsedListDto> alvUsedListIf = service.getAlvList(userNo, pageVoAlv);
		System.out.println(alvUsedListIf);
		if (alvUsedListIf != null) {
			
			for (LvUsedListDto al : alvUsedListIf) {
				String start = String.valueOf(al.getLvStart());
				String end =  String.valueOf(al.getLvEnd());
				al.setDuring(start + " ~ " + end);
			}
			model.addAttribute("alvUsedListIf", alvUsedListIf);
			model.addAttribute("page", pageVoAlv);
		}

		return "leave/lvUsedList1";
	}
	
	// 로그인한 사용자의 휴가사용내역
	@GetMapping(value = {"/lvUsedListIf/{page2}", "lvUsedListIf"} )
	public String lvUsedList(HttpSession session, Model model, @PathVariable(required = false) String page2) throws Exception {
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		String userNo = loginUser.getUserNo();
		if (page2 == null) {
			return "redirect:lvUsedListIf/1";
		}

		//페이지vo생성 int currentPage, int cntPerPage, int pageBtnCnt, int totalRow
		int cntPerPage = 4; // 한 페이지 당 14개씩 보여주기
		int pageBtnCnt = 3; // 한 번에 보여줄 버튼 개수
		int totalLvRow = service.getLvRowCnt(userNo); // 디비에 있는 모든 휴가사용내역 데이터개수
		PageVo pageVoLv = new PageVo(page2, cntPerPage, pageBtnCnt, totalLvRow);
			
		// 로그인한 사용자의 휴가사용내역
		List<LvUsedListDto> lvUsedListIf = service.getAlvList(userNo, pageVoLv);
		if (lvUsedListIf != null) {
			
			for (LvUsedListDto al : lvUsedListIf) {
				String start = String.valueOf(al.getLvStart());
				String end =  String.valueOf(al.getLvEnd());
				al.setDuring(start + " ~ " + end);
			}
			model.addAttribute("lvUsedListIf", lvUsedListIf);
			model.addAttribute("page2", pageVoLv);
		}

		return "leave/lvUsedList2";
	}
	
	
	
	
	
	
	
	@GetMapping("alvCal") // 연차 정산
	public String alvCal(HttpSession session, Model model) throws Exception {
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		String userNo = loginUser.getUserNo();
		UserDto user = service.getThisUser(userNo);
		// 발생시작일자 고민해보기
		
		// 임시로직 for 중간발표
		float usedAlv = 0; 
		
		List<LvUsedListDto> alvUsageCalList = service.getAlvUsageCal(userNo);
		for (LvUsedListDto alc : alvUsageCalList) {
			String start = String.valueOf(alc.getLvStart());
			String end =  String.valueOf(alc.getLvEnd());
			alc.setDuring(start + " ~ " + end);
			// 임시로직 for 중간발표
			usedAlv = usedAlv + alc.getReduceAlv();
		}
		int size = alvUsageCalList.size();
		model.addAttribute("size", size);
		model.addAttribute("alvUsageCalList", alvUsageCalList);
		model.addAttribute("user", user);
		// 임시로직 for 중간발표
		model.addAttribute("usedAlv", usedAlv);
		return "leave/alvCal";
	}

//============================= 사용자 메뉴 =============================	
	@GetMapping("lvInfo") // 사용자 휴무 정보 게시글
	public String lvInfo(Model model, HttpSession session) throws Exception {
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		String leaveRight = loginUser.getLeaveRight();
		List<LvInfoDto> lvInfoList = service.getLvInfoList();
		
		session.setAttribute("leaveRight", leaveRight);
		model.addAttribute("lvInfoList", lvInfoList);
		
		return "leave/leaveInfo";
	}
	
	@GetMapping("lvInfoDetail/{no}")
	public String lvInfoDetail(@PathVariable int no, HttpServletRequest request, HttpSession session) throws Exception {
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		String leaveRight = loginUser.getLeaveRight();
		
		int lvbNo = Integer.valueOf(no);
		
		LvInfoDto lvInfoDetail = service.lvInfoDetail(lvbNo);

		session.setAttribute("leaveRight", leaveRight);
		request.setAttribute("lvInfoDetail", lvInfoDetail);
		
		
		return "leave/lvInfoDetail";
	}

	
	
	
}
