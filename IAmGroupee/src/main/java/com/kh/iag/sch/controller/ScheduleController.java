package com.kh.iag.sch.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.iag.sch.entity.SchDto;
import com.kh.iag.sch.service.ScheduleService;
import com.kh.iag.sch.service.ScheduleServiceImpl;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("sch")
public class ScheduleController {

	@Autowired
	private ScheduleService scheduleService;
	
	// 내 캘린더 보여주기
	@GetMapping("mySch")
	public String mySch() {
		return "sch/mySch";
	}
	
	// 캘린더 예제 페이지
	@GetMapping("schedule")
	public String schedule() {	
	
        return "sch/schedule";
    }
	
	// 스케줄 추가하기
//	@ResponseBody
//	@RequestMapping(value = "/addSchedule", method = RequestMethod.GET)
//	public Map<Object,Object> addSchedule(@RequestBody SchDto dto) throws Exception {
//		
//		Map<Object,Object>map = new HashMap<Object,Object>();
//
//		ScheduleService scheduleService = new ScheduleService();
//		scheduleService.addSchedule(dto);
//
//		return map;
//	}
}
