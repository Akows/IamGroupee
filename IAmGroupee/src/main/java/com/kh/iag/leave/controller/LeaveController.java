package com.kh.iag.leave.controller;

import java.util.Date;
import java.util.HashMap;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

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
		String userNo = loginUser.getUserNo();
		Map<String, Object> duringDate = calDuringDate(userNo);
		String startDate = (String) duringDate.get("startDate");
		String endDate = (String) duringDate.get("endDate");
		
		String during = startDate + "~" + endDate;
		String stDate = during.split("~")[0];
//		상단바
		UserDto allUsedAlv = service.getThisUser(userNo);
		// 총연차개수 set해주기
			int alvTotalCount = allUsedAlv.getAlvCount() + allUsedAlv.getMlvCount() + allUsedAlv.getAlvAddCount();
			allUsedAlv.setAlvTotalCount(alvTotalCount);		
		// 사용내역에 updateReduceAlv하기
			service.updateReduceAlv();
			
		// 사용연차개수 update해주기
			float alvUsedCount = service.getAlvUsedCount(userNo);
			service.updateAlvUsedCount(userNo, alvUsedCount);
		
			
//		사용내역
		List<LvUsedListDto> allUsedList = service.getAllUsage(userNo);
		for (LvUsedListDto allUsedLv : allUsedList) {
			if(allUsedLv.getLvCode().equals("ALV_01")) {
				allUsedLv.setReduceAlv(1);
			} else if (allUsedLv.getLvCode().equals("ALV_02")) {
				allUsedLv.setReduceAlv((float) 0.5);
			} else if (allUsedLv.getLvCode().equals("ALV_03")) {
				allUsedLv.setReduceAlv((float) 0.25);
			}
			
			Date startLv = allUsedLv.getLvStart();
			Date endLv = allUsedLv.getLvStart();
			String duringLv = startLv + " ~ " + endLv;
			allUsedLv.setDuring(duringLv);
		}
		
//		사용예정내역
		List<LvUsedListDto> allUseList = service.getWillUsage(userNo);
		for (LvUsedListDto allUseLv : allUseList) {
			if(allUseLv.getLvCode().equals("ALV_01")) {
				allUseLv.setReduceAlv(1);
			} else if (allUseLv.getLvCode().equals("ALV_02")) {
				allUseLv.setReduceAlv((float) 0.5);
			} else if (allUseLv.getLvCode().equals("ALV_03")) {
				allUseLv.setReduceAlv((float) 0.25);
			}
			
			Date startLv = allUseLv.getLvStart();
			Date endLv = allUseLv.getLvStart();
			String duringLv = startLv + " ~ " + endLv;
			allUseLv.setDuring(duringLv);
		}
//		발생내역
		List<AlvOccurHistoryDto> lvHistoryList = service.getOccurHistory(userNo);

		model.addAttribute("stDate", stDate);
		model.addAttribute("allUsedAlv", allUsedAlv);
		model.addAttribute("allUseList", allUseList);
		model.addAttribute("allUsedAlvList", allUsedAlv);
		model.addAttribute("allUsedList", allUsedList);
		model.addAttribute("lvHistoryList", lvHistoryList);
		model.addAttribute("during",during);
		
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
				if(al.getLvCode().equals("ALV_01")) {
					al.setReduceAlv(1);
				} else if (al.getLvCode().equals("ALV_02")) {
					al.setReduceAlv((float) 0.5);
				} else if (al.getLvCode().equals("ALV_03")) {
					al.setReduceAlv((float) 0.25);
				}
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
		int pageBtnCnt = 2; // 한 번에 보여줄 버튼 개수
		int totalAlvRow = service.getAlvRowCnt(userNo); // 디비에 있는 모든 연차사용내역 데이터개수
		PageVo pageVoAlv = new PageVo(page, cntPerPage, pageBtnCnt, totalAlvRow);
			
		// 로그인한 사용자의 연차사용내역
		List<LvUsedListDto> alvUsedListIf = service.getAlvList(userNo, pageVoAlv);
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
		int pageBtnCnt = 2; // 한 번에 보여줄 버튼 개수
		int totalLvRow = service.getLvRowCnt(userNo); // 디비에 있는 모든 휴가사용내역 데이터개수
		PageVo pageVoLv = new PageVo(page2, cntPerPage, pageBtnCnt, totalLvRow);
//		System.out.println("휴가" + pageVoLv);
			
		// 로그인한 사용자의 휴가사용내역
		List<LvUsedListDto> lvUsedListIf = service.getLvList(userNo, pageVoLv);
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
		// 발생시작일자 고민해보기
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		String userNo = loginUser.getUserNo();
		UserDto user = service.getThisUser(userNo);
		
		// 로그인한 사용자의 연차사용내역
		List<LvUsedListDto> alvUsageCalList = service.getAlvUsageCal(userNo);
		for (LvUsedListDto alc : alvUsageCalList) {

			if(alc.getLvCode().equals("ALV_01")) {
				alc.setReduceAlv(1);
			} else if (alc.getLvCode().equals("ALV_02")) {
				alc.setReduceAlv((float) 0.5);
			} else if (alc.getLvCode().equals("ALV_03")) {
				alc.setReduceAlv((float) 0.25);
			}
			String start = String.valueOf(alc.getLvStart());
			String end =  String.valueOf(alc.getLvEnd());
			alc.setDuring(start + " ~ " + end);
		}
		int size = alvUsageCalList.size();
		model.addAttribute("size", size);
		model.addAttribute("alvUsageCalList", alvUsageCalList);
		model.addAttribute("user", user);
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
	
	@GetMapping("lvInfoDetail/{no}") // 사용자 휴무 정보 게시글 상세보기
	public String lvInfoDetail(@PathVariable int no, HttpServletRequest request, HttpSession session) throws Exception {
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		String leaveRight = loginUser.getLeaveRight();
		
		int lvbNo = Integer.valueOf(no);
		
		LvInfoDto lvInfoDetail = service.lvInfoDetail(lvbNo);

		session.setAttribute("leaveRight", leaveRight);
		request.setAttribute("lvInfoDetail", lvInfoDetail);
		
		return "leave/lvInfoDetail";
	}

	
	@GetMapping("alvUrge") // 연차 사용 촉구서
	public String alvUrge(HttpSession session, Model model) throws Exception {
		Map<String, Object> duringDate = new HashMap<String, Object>();
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		String userNo = loginUser.getUserNo();
		UserDto user = service.getThisUser(userNo);
		int alvTotalCount = user.getAlvCount() + user.getMlvCount() + user.getAlvAddCount();
		user.setAlvTotalCount(alvTotalCount);	
		//주민번호 앞자리
		String birthday = loginUser.getResidentNo().split("-")[0];
		loginUser.setResidentNo(birthday);
		
		duringDate = calDuringDate(userNo);
		String startDate = (String) duringDate.get("startDate");
		String endDate = (String) duringDate.get("endDate");
		
		String during = startDate + "~" + endDate;
		
		model.addAttribute("during",during);
		model.addAttribute("loginUser",loginUser);
		
		return "leave/alvUrge";
	}
	
	public Map<String, Object> calDuringDate(String userNo) throws Exception { 
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM-dd");
		Calendar today = Calendar.getInstance(); 
		UserDto user = service.getThisUser(userNo);
		Map<String, Object> duringDate = new HashMap<String, Object>();
		String startDate = "";
		String endDate = "";
		
		// 현재날짜의 년월일
		String todayDate = format.format(today.getTime()); // 오늘 날짜"yyyy-MM-dd"
		String todayMonthDate = todayDate.split("-")[1] + "-" + todayDate.split("-")[2]; // 현재날짜의 월일"MM-dd"
		
		// 입사일의 월일
		String enrollDate = String.valueOf(format.format(user.getEnrollDate()));// 입사 날짜"yyyy-MM-dd"
		String enrollMonthDate = enrollDate.split("-")[1] + "-" + enrollDate.split("-")[2]; // 입사 월일"MM-dd"
		
		Date toMonthDate = dateFormat.parse(todayMonthDate);
		Date enMonthDate = dateFormat.parse(enrollMonthDate);
		
		String claDate = todayDate.split("-")[0] + "-" + enrollMonthDate;
		
		int compare = toMonthDate.compareTo(enMonthDate);
		
		if (compare < 0) {
			startDate = AddDate(claDate, -1, 0, 0);
			endDate = AddDate(claDate, 0, 0, -1);
		} else if (compare > 0) {
			startDate = todayDate.split("-")[0] + "-" + enrollMonthDate;
			endDate = AddDate(claDate, 0, 0, -1);
			endDate = AddDate(claDate, 1, 0, 0);
		} else {
			startDate = AddDate(claDate, -1, 0, 0);
			endDate = AddDate(claDate, 0, 0, -1);
		}
		
		duringDate.put("startDate", startDate);
		duringDate.put("endDate", endDate);
		
		return duringDate;
	}	

	// 1씩 증가/감소하는 날짜 (리터타입 : String)
	public String AddDate(String strDate, int year, int month, int day) throws Exception { 
		SimpleDateFormat dtFormat = new SimpleDateFormat("yyyy-MM-dd"); 
		Calendar cal = Calendar.getInstance(); 
		Date dt = dtFormat.parse(strDate); 
		cal.setTime(dt); 
		cal.add(Calendar.YEAR, year); 
		cal.add(Calendar.MONTH, month); 
		cal.add(Calendar.DATE, day); 
		return dtFormat.format(cal.getTime()); 
	}
}
