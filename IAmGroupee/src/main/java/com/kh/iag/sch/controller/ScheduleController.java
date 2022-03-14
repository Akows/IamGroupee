package com.kh.iag.sch.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.iag.sch.entity.SchDto;
import com.kh.iag.sch.service.ScheduleService;
import com.kh.iag.user.entity.UserDto;

@Controller
@RequestMapping("sch")
public class ScheduleController {
	
	private static final Logger logger = LoggerFactory.getLogger(ScheduleController.class);
	
	@Autowired
	private ScheduleService service;	
	
	// 내 캘린더 보여주기
	@GetMapping("mySch")
	public String mySch(HttpSession session, Model model) throws Exception {
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		String userNo = loginUser.getUserNo();
		// DB에 있는 일정 가져오기
		// 개인일정 
		List<SchDto> personalList = getPersonalList(userNo);
		// 부서일정 
		List<SchDto> deptList = getDeptList(userNo);
		// 전사일정
		List<SchDto> corpList = getCorpList(userNo);
		
		model.addAttribute("personalList", personalList);
		model.addAttribute("deptList", deptList);
		model.addAttribute("corpList", corpList);
		model.addAttribute("userNo", userNo);
		
		return "sch/enrollSch";
	}
	@GetMapping("mySch2")
	public String mySch2(HttpSession session, Model model) {
		return "sch/mySch2";
	}
	// 일정 수정하기
	@PostMapping("modSch")
	public String modSch(String schNum, String schTitle, String schEnroll, String schContent) throws Exception {
		SchDto modSchDto = new SchDto();
		modSchDto.setSchNum(Integer.parseInt(schNum));
		modSchDto.setSchTitle(schTitle);
		modSchDto.setSchContent(schContent);
		if (schEnroll.length() > 11 ) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			String start = schEnroll.split("~")[0];
			String end = schEnroll.split("~")[1];
			Date schStart = format.parse(start);
			Date schEnd = format.parse(end);
			modSchDto.setSchStart(schStart);
			modSchDto.setSchEnd(schEnd);
		} else {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date schEnrollMod = format.parse(schEnroll);
			modSchDto.setSchStart(schEnrollMod);
			modSchDto.setSchEnd(schEnrollMod);
		}
		service.modifySch(modSchDto);
		
		return "redirect:/sch/mySch2";
	}
	
	
	
	// 스케줄 등록
	@PostMapping("mySch")
	public String enrollSchedule(SchDto schDto, HttpSession session) throws Exception {
		// userNo세팅
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		schDto.setUserNo(loginUser.getUserNo());
		// 일정 시작날짜 종료날짜 등록
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String start = schDto.getSchEnroll().split("~")[0];
		String end = schDto.getSchEnroll().split("~")[1];
		Date schStart = format.parse(start);
		Date schEnd = format.parse(end);
		schDto.setSchStart(schStart);
		schDto.setSchEnd(schEnd);
		
		service.enrollSchedule(schDto);
		
		return "redirect:mySch2";
	}

	// 개인일정 
	public List<SchDto> getPersonalList(String userNo) throws Exception {
		List<SchDto> personalList = new ArrayList<SchDto>();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		personalList = service.getPersonalList(userNo);
		for (SchDto schDto : personalList) {
			String start = format.format(schDto.getSchStart());
			String end = format.format(schDto.getSchEnd());
			schDto.setSchStartStr(start);
			schDto.setSchEndStr(end);
		}
		return personalList;
	}
	// 부서일정 
	public List<SchDto> getDeptList(String userNo) throws Exception {
		List<SchDto> deptList = new ArrayList<SchDto>();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		deptList = service.getDeptList(userNo);
		for (SchDto schDto : deptList) {
			String start = format.format(schDto.getSchStart());
			String end = format.format(schDto.getSchEnd());
			schDto.setSchStartStr(start);
			schDto.setSchEndStr(end);
		}
		return deptList;
	}
	// 전사일정 
	public List<SchDto> getCorpList(String userNo) throws Exception {
		List<SchDto> corpList = new ArrayList<SchDto>();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		corpList = service.getCorpList(userNo);
		for (SchDto schDto : corpList) {
			String start = format.format(schDto.getSchStart());
			String end = format.format(schDto.getSchEnd());
			schDto.setSchStartStr(start);
			schDto.setSchEndStr(end);
		}
		return corpList;
	}
}
