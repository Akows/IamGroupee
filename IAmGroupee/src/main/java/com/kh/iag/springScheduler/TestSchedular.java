package com.kh.iag.springScheduler;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.kh.iag.attend.entity.AttendDTO;
import com.kh.iag.leave.service.LeaveService;
import com.kh.iag.user.entity.UserDto;

@Component
public class TestSchedular {

	@Autowired
	private LeaveService service;
	@Autowired
	private SqlSession sqlSession;

	// 전체 사원목록 구하기
	public List<UserDto> getAllUserInfo() throws Exception {

		List<UserDto> allUserInfo = service.getAllUserInfo();

		return allUserInfo;
	}






	// 연차사용 촉구서 이메일로 보내고 보내는 거 
	//	@Scheduled(cron = "0 30 0 1/1 * *")
	//	public void urgeUseAnnualLeave() throws Exception {
	//		List<UserDto> allUserInfo = getAllUserInfo();
	//		
	//		for (UserDto userDto : allUserInfo) {
	//			SimpleDateFormat format = new SimpleDateFormat("yyyy-M-d");
	//			Calendar today = Calendar.getInstance(); 
	//			String todayDate = format.format(today.getTime()); // 오늘 날짜"yyyy-M-d"
	//			String enrollDate = String.valueOf(format.format(userDto.getEnrollDate()));// 입사 날짜"yyyy-M-d"
	//			
	//		}
	//		
	//		
	//	}

	//	@Scheduled(cron = "0 5 0 1/1 * ? *")
	//	public void createAnnualLeave() {
	//		// 연차생성로직

	//	}

//======================================= 더미 데이터 ===========================================	

	// 평일 수 구하기
	public int checkWorkingDays(String startDate, String endDate) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d");
		int workingDays = 0;
		try {
			Calendar start = Calendar.getInstance();
			start.setTime(sdf.parse(startDate));
			Calendar end = Calendar.getInstance();
			end.setTime(sdf.parse(endDate));
			while (!start.after(end)) {
				int day = start.get(Calendar.DAY_OF_WEEK);
				if ((day != Calendar.SATURDAY) && (day != Calendar.SUNDAY))
					workingDays++;
				start.add(Calendar.DATE, 1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return workingDays; 
	}

	// 1씩 증가/감소하는 날짜 (리터타입 : String)
	public String AddDate(String strFormat, String strDate, int year, int month, int day) throws Exception { 
		SimpleDateFormat dtFormat = new SimpleDateFormat(strFormat); 
		Calendar cal = Calendar.getInstance(); 
		Date dt = dtFormat.parse(strDate); 
		cal.setTime(dt); 
		cal.add(Calendar.YEAR, year); 
		cal.add(Calendar.MONTH, month); 
		cal.add(Calendar.DATE, day); 
		return dtFormat.format(cal.getTime()); 
	}

	// 더미데이터 넣기
//	@Scheduled(fixedRate = 1000 * 20)
	public void addDummyData() throws Exception {

		AttendDTO attendDTO = new AttendDTO();

		//	=== 임시로직 === 사원의 근속일수 데이터 채우기 (근태 도메인 구현 완료 시 수정 및 삭제)

		// 평일 수 구하기
		// todayYear 현재 연도, enrollMonthDay 입사월일 =====> 파라미터로 넘길 거 lastDueDate 작년 업데이트일, thisDueDate 이번업데이트예정일
		// todayYear 현재 연도, enrollMonthDay 입사월일 =====> 파라미터로 넘길 거 lastDueDay,  작년 업데이트일, thisDueDay 이번업데이트예정일

		// =====Date to String=====	
		//		SimpleDateFormat format = new SimpleDateFormat("yyyy-M-d");
		//		Calendar today = Calendar.getInstance(); 
		String todayDate = "2022-3-10"; // 오늘 날짜"yyyy-M-d"
		String enrollDate1 = "2020-3-9";// 입사 날짜"yyyy-M-d"1년이상
		String enrollDate2 = "2021-12-9";// 입사 날짜"yyyy-M-d"1년미만

		// =====연차=====	
		String todayYear = todayDate.substring(0,4); // 오늘 연도"yyyy"
		String enrollMonthDay = enrollDate1.substring(5); // 입사 월일 "M-d"
		int lastYear = Integer.parseInt(todayYear) - 1;
		String lastDueDate = String.valueOf(lastYear) + "-" + enrollMonthDay; // 작년도 업데이트일 "yyyy-M-d"
		String thisDueDate = todayYear + "-" + enrollMonthDay; // 이번년도 업데이트일 "yyyy-M-d"

		// 평일 수
		int workDayOfLastYear = checkWorkingDays(lastDueDate, thisDueDate);

		// =====월차=====	lastDueDay/thisDueDay"2021-12-9""yyyy-M-d"thisDueDate
		String todayMonth = "";
		String enrollDay = "";

		// 입사일의 일
		if (enrollDate2.length() == 9 && !enrollDate2.substring(7, 8).equals("-")) {
			enrollDay = enrollDate2.substring(6); // 입사 일 "-d"
		} else if (enrollDate2.length() == 9 && enrollDate2.substring(7, 8).equals("-")) {
			enrollDay = enrollDate2.substring(7); // 입사 일 "-d"
		} else if (enrollDate2.length() == 10 && enrollDate2.substring(7, 8).equals("-")) {
			enrollDay = enrollDate2.substring(7); // 입사 일 "-d"
		} else {
			enrollDay = enrollDate2.substring(6); // 입사 일 "-d"
		}
		//		현재날짜의 월
		if (todayDate.length() == 9 && !todayDate.substring(7, 8).equals("-")) {
			todayMonth = todayDate.substring(5,6); // 오늘 월"M"
		} else if (todayDate.length() == 9 && todayDate.substring(7, 8).equals("-")) {
			todayMonth = todayDate.substring(5,7); // 오늘 월"M"
		} else if (todayDate.length() == 10 && todayDate.substring(7, 8).equals("-")) {
			todayMonth = todayDate.substring(5,7); // 오늘 월"M"
		} else {
			todayMonth = todayDate.substring(5,6); // 오늘 월"M"
		}
		int lastMonth = 0;

		if(todayMonth.equals("1")){
			lastMonth = 12;
			lastYear = Integer.parseInt(todayYear) - 1;
		} else{			lastMonth = Integer.parseInt(todayMonth) - 1;
			lastYear = Integer.parseInt(todayYear);
		}
		//
		String lastDueDay = String.valueOf(lastYear) + "-" + String.valueOf(lastMonth) + enrollDay; // 저번달 업데이트일 "yyyy-M-d"
		String thisDueDay = String.valueOf(lastYear) + "-" + todayMonth + enrollDay; // 이번달 업데이트일 "yyyy-M-d"

		// 평일 수
		int workDayOfLastMonth = checkWorkingDays(lastDueDay, thisDueDay);
		System.out.println("workDayOfLastMonth : " + workDayOfLastMonth);

		// =====연차=====	
		// 근속일수 80% 기준 개수
		int workDay80PerOfYear = (workDayOfLastYear / 10) * 8;
		System.out.println("workDay80PerOfYear : " + workDay80PerOfYear);

		// 전년도 근속일 수 80%이상
		for(int i = 1; i < workDay80PerOfYear + 20; i++){
			String strAttendDate = AddDate("yyyy-MM-dd", lastDueDate, 0, 0, i);
			attendDTO.setAttend_date(strAttendDate);
			attendDTO.setUser_no("2222");
			attendDTO.setUser_name("연차관리80이상");
			sqlSession.insert("leave.attendtempInsert", attendDTO);
		}

		// 전년도 근속일 수 80%미만
		for(int i = 1; i < workDay80PerOfYear - 20; i++){
			String strAttendDate = AddDate("yyyy-MM-dd", lastDueDate, 0, 0, i);
			attendDTO.setAttend_date(strAttendDate);
			attendDTO.setUser_no("222");
			attendDTO.setUser_name("1년이상80미만");
			sqlSession.insert("leave.attendtempInsert", attendDTO);
		}

		// =====월차=====	lastDueDay/thisDueDay

		// 개근일 때
		for(int i = 1; i <= workDayOfLastMonth; i++){
			String strAttendDate = AddDate("yyyy-MM-dd", lastDueDay, 0, 0, i);
			attendDTO.setAttend_date(strAttendDate);
			attendDTO.setUser_no("22");
			attendDTO.setUser_name("1년미만개근O");
			sqlSession.insert("leave.attendtempInsert", attendDTO);
		}

		// 개근아닐때
		for(int i = 1; i < workDayOfLastMonth - 5; i++){
			String strAttendDate = AddDate("yyyy-MM-dd", lastDueDay, 0, 0, i);
			attendDTO.setAttend_date(strAttendDate);
			attendDTO.setUser_no("2");
			attendDTO.setUser_name("1년미만개근X");
			sqlSession.insert("leave.attendtempInsert", attendDTO);
		}

		System.out.println("실행됨");
	}

}
