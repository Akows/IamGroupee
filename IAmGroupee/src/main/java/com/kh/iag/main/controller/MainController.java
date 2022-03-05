package com.kh.iag.main.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.iag.leave.service.LeaveService;
import com.kh.iag.login.service.LoginService;
import com.kh.iag.login.vo.CheckedVo;
import com.kh.iag.user.entity.UserDto;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MainController {
	
	@Autowired
	private LoginService service;
	
	@Autowired
	private LeaveService leaveService;
	@Autowired
	private SqlSession sqlSession;
	
	// 로그인 화면
	@GetMapping("login")
	public String login(HttpServletRequest request) {
		return "login";
	}
	
	// 로그인 처리
	@PostMapping("login")
	public String login(UserDto dto, HttpSession session, HttpServletResponse response, HttpServletRequest request, CheckedVo checkedVo) throws Exception {

			// 세션에 담기 전에 세션 초기화
			if ( session.getAttribute("loginUser") != null ){
				session.removeAttribute("loginUser"); 
			}
			// 로그인 로직
			UserDto loginUser = service.login(dto);
			
			if (loginUser != null) {
				//세션에 담기
				session.setAttribute("loginUser",loginUser);

				String[] checkedValues = checkedVo.getChecked();
				if(checkedValues != null) {
					String checkedValue = "";
					
					for(String cv : checkedValues) {
						checkedValue += cv;
						if(checkedValue.equals("numlogin") || checkedValue.equals("loginnum")) {
							// 자동 로그인 쿠키 생성
							Cookie savedLoginCookie = new Cookie("savedLoginCookie", session.getId());
							savedLoginCookie.setPath("/");
							
							LocalTime now = LocalTime.now();
							int hour = now.getHour();
							int minute = now.getMinute();
							int second = now.getSecond();
							int savedTime = 60 * 60 * 24;
							savedLoginCookie.setMaxAge(savedTime);
							
							Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * savedTime));
							
							// loginUser 디비에 sessionKey랑 sessionLimit시간 update하기
							int ssResult = service.savedLoginCookie(loginUser.getUserNo(), session.getId(), sessionLimit);
							
							// 화면에 보낸다.
							response.addCookie(savedLoginCookie);
							
							// 보름 간 아이디 저장 쿠키 생성
							Cookie rememIdCookie = new Cookie("rememIdCookie", String.valueOf(loginUser.getUserNo()));
							rememIdCookie.setPath("/");
							rememIdCookie.setMaxAge(60 * 60 * 24 * 15);
							
							response.addCookie(rememIdCookie);
							
						} else if (checkedValue.equals("num")) {
							// 보름 간 아이디 저장 쿠키 생성
							Cookie rememIdCookie = new Cookie("rememIdCookie", String.valueOf(loginUser.getUserNo()));
							rememIdCookie.setPath("/");
							rememIdCookie.setMaxAge(60 * 60 * 24 * 15);
							
							response.addCookie(rememIdCookie);
							
						} else if (checkedValue.equals("login")) {
							// 현재 rememIdCookie가 있다면 지우기
							Cookie[] cookies = request.getCookies();
							
							for(int i = 0; i<cookies.length; i++){
								String name = cookies[i].getName();
								String value = cookies[i].getValue();
								if(name.equals("rememIdCookie")){
									cookies[i].setPath("/");
									cookies[i].setMaxAge(0);
									response.addCookie(cookies[i]);
								}
							}
							// 자동 로그인 쿠키 생성
							Cookie savedLoginCookie = new Cookie("savedLoginCookie", session.getId());
							savedLoginCookie.setPath("/");
							
							LocalTime now = LocalTime.now();
							int hour = now.getHour();
							int minute = now.getMinute();
							int second = now.getSecond();
							int savedTime = 60 * 60 * 24;
							savedLoginCookie.setMaxAge(savedTime);
							
							Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * savedTime));
							
							// loginUser 디비에 sessionKey랑 sessionLimit시간 update하기
							int ssResult = service.savedLoginCookie(loginUser.getUserNo(), session.getId(), sessionLimit);
							
							response.addCookie(savedLoginCookie); // 화면에 보낸다.
						}
					}
					return "redirect:/main";
				} else {
					Cookie[] cookies = request.getCookies();
					
					for(int i = 0; i<cookies.length; i++){
						String name = cookies[i].getName();
						String value = cookies[i].getValue();
						if(name.equals("rememIdCookie")){
							cookies[i].setPath("/");
							cookies[i].setMaxAge(0);
							response.addCookie(cookies[i]);
						}
					}
					return "redirect:/main";
				}
			} 
				//실패
			return "redirect:/login";
//			return "login";
			
		}

	
	// 로그아웃
	@GetMapping("logout")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 자동로그인 쿠키 삭제
		Cookie[] cookies = request.getCookies();
		
		for(int i = 0; i<cookies.length; i++){
			String name = cookies[i].getName();
			String value = cookies[i].getValue();
			if(name.equals("savedLoginCookie")){
				cookies[i].setPath("/");
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
			}
		}
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		
		// user db의 sessionLimit을 현재시간으로 다시 변경
		Date date = new Date(System.currentTimeMillis());
		service.savedLoginCookie(loginUser.getUserNo(), session.getId(), date);
		// 세션만료
		session.invalidate();
	
		
		return "redirect:/login";
	}
	
	
	// 메인으로
	@GetMapping("main")
	public String main() throws Exception {

		
		
		/** // 연차로직 잠시 주석  스케쥴러로 이동시킬 예정
		String userNo = loginUser.getUserNo();
//		============입사일 기준 연차 발생
		// 입사일의 월일
		String enrollMonth = String.valueOf(format.format(loginUser.getEnrollDate())).substring(5, 5); // 입사월"M"
		int month = Integer.parseInt(enrollMonth);
		String enrollDay = String.valueOf(format.format(loginUser.getEnrollDate())).substring(6);; // 입사일"-d"
		
		
		
		
		
		
		
		//연차발생로직 시작
		String returnUrl = "";
		
		// 조건1. 현재날짜 - 입사일 ==> 1년 미만/이상
		Calendar getToday = Calendar.getInstance();
		getToday.setTime(new Date()); //금일 날짜
		Date date = new SimpleDateFormat("yyyy-MM-dd").parse(enrollDate);
		Calendar cmpDate = Calendar.getInstance();
		cmpDate.setTime(date); //특정 일자
		
		long diffDays = ((getToday.getTimeInMillis() - cmpDate.getTimeInMillis()) / 1000) / (24*60*60); //일자수 차이
		
		System.out.println(diffDays + "일 차이");
		
		if (diffDays >= 365) {
			// 1년 이상 ==> 전년도 근속일수 80%이상/미만
			int result = leaveService.checkOverEighty(userNo);
			
			if (result == 1) { // 80% 이상 -> 조건2
				// 조건2. 연차조건
				returnUrl = conditionAlv(enrollDate, todayDate, userNo);
				return returnUrl;
				
			} else { // 80% 미만 -> 조건3
				// 조건3. 월차조건
				returnUrl = conditionMlv(enrollDay, todayDate, userNo, month);
				return returnUrl;
			}
			
		} else { // 1년 미만 -> 조건3
			// 조건3. 월차조건
			returnUrl = conditionMlv(enrollDay, todayDate, userNo, month);
			
//			return returnUrl;
		}
		
		**/ // 연차로직 잠시 주석ㄱ
		
		return "mainPage";
	}
	
	

	/** // 연차로직 잠시 주석ㄱ
	
	
	// 조건2. 연차조건
	public String conditionAlv(String enrollDate, String todayDate, String userNo) {
		String returnUrl = "";
		// 오늘 발생한 연차가 있는지 (없어야한다)
		int occurToday = leaveService.checkOccurAlvToday(userNo);

		if (todayDate.equals(enrollDate) && occurToday == 0) {
			int result = leaveService.addAlvCount(userNo);
			
			if (result > 0) {
				returnUrl = "mainPage";
			} else {
				returnUrl = "common/error/wrongRight";
			}
		}
		return returnUrl;
	}

	// 조건3. 월차조건
	public String conditionMlv(String enrollDay, String todayDate, String userNo, int month) {
		String returnUrl = "";

		switch (month) {
		case 3: case 4: case 5: case 6: case 7: case 8: case 9: case 10:
			for (int i = 1; i < 12 - month; i++) {
				String dueDate = (month + i) + enrollDay;
				returnUrl = checkPossibility(dueDate, todayDate, userNo);
			}
			for (int i = month - 1; i > 0; i--) {
				String dueDate = (month - i) + enrollDay;
				returnUrl = checkPossibility(dueDate, todayDate, userNo);
			}
			break;
			
		case 1:
			for (int i = 1; i < 12 - month; i++) {
				String dueDate = (month + i) + enrollDay;
				returnUrl = checkPossibility(dueDate, todayDate, userNo);
			}
			break;
			
		case 2:
			for (int i = 1; i < 12 - month; i++) {
				String dueDate = (month + i) + enrollDay;
				returnUrl = checkPossibility(dueDate, todayDate, userNo);
			}
			if (todayDate.equals("1"+enrollDay)) {
				// 오늘 발생한 월차가 있는지 (없어야한다)
				int occurToday = leaveService.checkOccurMlvToday(userNo);
				// 이전 달에 개근을 했는지 (했어야한다)
				int attendAll = leaveService.checkAttendAll(userNo);
				
				if (occurToday == 0 && attendAll == 1) {
					// 로그인 유저의 총월차개수 update +1
					int result = leaveService.addMlvCount(userNo);
					
					if (result > 0) {
						returnUrl = "mainPage";
					}else {
						returnUrl = "common/error/wrongRight";
					}
				}
			}
			break;
			
		case 11:
			for (int i = month - 1; i > 0; i--) {
				String dueDate = (month - i) + enrollDay;
				returnUrl = checkPossibility(dueDate, todayDate, userNo);
			}
			if (todayDate.equals("12"+enrollDay)) {
				// 오늘 발생한 월차가 있는지 (없어야한다)
				int occurToday = leaveService.checkOccurMlvToday(userNo);
				// 이전 달에 개근을 했는지 (했어야한다)
				int attendAll = leaveService.checkAttendAll(userNo);
				
				if (occurToday == 0 && attendAll == 1) {
					// 로그인 유저의 총월차개수 update +1
					int result = leaveService.addMlvCount(userNo);
					
					if (result > 0) {
						returnUrl = "mainPage";
					}else {
						returnUrl = "common/error/wrongRight";
					}
				}
			}
			break;
			
		case 12:
			for (int i = month - 1; i > 0; i--) {
				String dueDate = (month - i) + enrollDay;
				returnUrl = checkPossibility(dueDate, todayDate, userNo);
			}
			break;
		}
		return returnUrl;
	}
	
	
	// 월차가 발생할 수 있는 조건인지 체크해주는 메소드
	public String checkPossibility(String dueDate, String todayDate, String userNo) {
		
		String returnUrl = "";
		if (todayDate.equals(dueDate)) {
			// 오늘 발생한 월차가 있는지 (없어야한다)
			int occurToday = leaveService.checkOccurMlvToday(userNo);
			// 이전 달에 개근을 했는지 (했어야한다)
			int attendAll = leaveService.checkAttendAll(userNo);
			
			if (occurToday == 0 && attendAll == 1) {
				// 로그인 유저의 총월차개수 update +1
				int result = leaveService.addMlvCount(userNo);
				
				if (result > 0) {
					returnUrl = "mainPage";
				}else {
					returnUrl = "common/error/wrongRight";
				}
			}
		}
		
		return returnUrl;
	}
		
	
	
	**/ // 연차로직 잠시 주석ㄱ
	
	
	// 관리자 권한이 없을 시
	@GetMapping("wrongRight")
	public String main2() {

		String returnUrl = "common/error/wrongRight";
//		return "common/error/wrongRight";
		return returnUrl;
	}
	
}
