package com.kh.iag.springScheduler;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.kh.iag.attend.entity.AttendDTO;
import com.kh.iag.leave.service.LeaveService;
import com.kh.iag.user.entity.UserDto;

@Component
public class DummyData {

	@Autowired
	private LeaveService service;
	@Autowired
	private SqlSession sqlSession;

	// 전체 사원목록 구하기
	public List<UserDto> getAllUserInfo() throws Exception {

		List<UserDto> allUserInfo = service.getAllUserInfo();

		return allUserInfo;
	}
//======================================= 더미 데이터 ===========================================	
// 더미데이터 넣기
//	@Scheduled(fixedRate = 1000 * 20)
	public void addDummyData() throws Exception {

		AttendDTO attendDTO = new AttendDTO();

// ========연차========	
		// 평일 수
		int workDayOfLastYear = checkWorkingDays("2021-03-18", "2022-03-17");
		System.out.println("workDayOfLastYear : " + workDayOfLastYear);

// ========월차========	lastDueDay/thisDueDay"2021-12-9""yyyy-M-d"thisDueDate
		// 평일 수
		int workDayOfLastMonth1 = checkWorkingDays("2022-03-18", "2022-04-17");
		System.out.println("workDayOfLastMonth1 : " + workDayOfLastMonth1);
		int workDayOfLastMonth2 = checkWorkingDays("2022-04-18", "2022-05-17");
		System.out.println("workDayOfLastMonth2 : " + workDayOfLastMonth2);

// ========연차========	
		// 근속일수 80% 기준 개수
		int workDay80PerOfYear = (workDayOfLastYear / 10) * 8;
		System.out.println("workDay80PerOfYear : " + workDay80PerOfYear);
		int count1 = 0;
		int count2 = 0;
		int count3 = 0;
		int count4 = 0;
		int count5 = 0;
		// 전년도 근속일 수 80%이상
		for(int i = 0; i < workDay80PerOfYear + 20; i++){
			String strAttendDate = AddDate("yyyy-MM-dd", "2021-03-18", 0, 0, i);
			attendDTO.setAttend_date(strAttendDate);
			attendDTO.setUser_no("1616");
			attendDTO.setUser_name("사원2");
			sqlSession.insert("leave.attendtempInsert", attendDTO);
			count1++;
		}
		System.out.println("count1 : " + count1);
		// 전년도 근속일 수 80%미만
		for(int i = 0; i < workDay80PerOfYear - 20; i++){
			String strAttendDate = AddDate("yyyy-MM-dd", "2021-03-18", 0, 0, i);
			attendDTO.setAttend_date(strAttendDate);
			attendDTO.setUser_no("1717");
			attendDTO.setUser_name("사원3");
			sqlSession.insert("leave.attendtempInsert", attendDTO);
			count2++;
		}
		System.out.println("count2 : " + count2);


// ========월차========	lastDueDay/thisDueDay

		// 개근일 때
		for(int i = 0; i < workDayOfLastMonth1; i++){
			String strAttendDate = AddDate("yyyy-MM-dd", "2022-03-18", 0, 0, i);
			attendDTO.setAttend_date(strAttendDate);
			attendDTO.setUser_no("1717");
			attendDTO.setUser_name("사원3");
			sqlSession.insert("leave.attendtempInsert", attendDTO);
			count3++;
		}
		System.out.println("count3 : " + count3);

		// 개근아닐때
		for(int i = 0; i < workDayOfLastMonth1 - 5; i++){
			String strAttendDate = AddDate("yyyy-MM-dd", "2022-03-18", 0, 0, i);
			attendDTO.setAttend_date(strAttendDate);
			attendDTO.setUser_no("1818");
			attendDTO.setUser_name("사원4");
			sqlSession.insert("leave.attendtempInsert", attendDTO);
			count4++;
		}
		System.out.println("count4 : " + count4);
		for(int i = 0; i < workDayOfLastMonth2; i++){
			String strAttendDate = AddDate("yyyy-MM-dd", "2022-04-18", 0, 0, i);
			attendDTO.setAttend_date(strAttendDate);
			attendDTO.setUser_no("4444");
			attendDTO.setUser_name("코코미뇽");
			sqlSession.insert("leave.attendtempInsert", attendDTO);
			count5++;
		}
		System.out.println("count5 : " + count5);
		
		System.out.println("실행됨");
	}



	// 평일 수 구하기
	public int checkWorkingDays(String startDate, String endDate) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
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

}
