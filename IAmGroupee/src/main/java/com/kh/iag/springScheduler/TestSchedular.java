package com.kh.iag.springScheduler;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.kh.iag.user.entity.UserDto;

@Component
public class TestSchedular {
	
//	HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder .getRequestAttributes()).getRequest();
//	HttpSession session = request.getSession();
//	UserDto loginUser = (UserDto) session.getAttribute("loginUser");
	
//	@Scheduled(cron = "0 0 12 1 1/1 ? *")
//	public void urgeUseAnnualLeave() {
	
//	=== 임시로직 === 사원의 근속일수 데이터 채우기 (근태 도메인 구현 완료 시 수정 및 삭제)
	
	// 평일 수 구하기
		// todayYear 현재 연도, enrollMonthDay 입사월일 =====> 파라미터로 넘길 거 lastDueYear 작년 업데이트일, thisDueDate 이번업데이트예정일
		/**
		SimpleDateFormat format = new SimpleDateFormat("yyyy-M-d");
		Calendar today = Calendar.getInstance(); 
		String todayDate = format.format(today.getTime()); // 오늘 날짜"yyyy-M-d"
		String enrollDate = String.valueOf(format.format(loginUser.getEnrollDate()));// 입사 날짜"yyyy-M-d"
		String todayYear = todayDate.substring(0,4); // 오늘 연도"yyyy"
		String enrollMonthDay = enrollDate.substring(5, 7); // 입사 월일 "M-d"
		int lastYear = Integer.parseInt(todayYear) - 1;
		String lastDueYear = String.valueOf(lastYear) + "-" + enrollMonthDay; // 작년 업데이트일 "yyyy-M-d"
		String thisDueDate = todayYear + "-" + enrollMonthDay; // 작년 업데이트일 "yyyy-M-d"
		**/
		// 평일 수
//		int workDay = checkWorkingDays(lastDueYear, thisDueDate);
		
		// 근속일수 80%
//		int workDay80Per = (workDay / 10) * 8;
		
		// 전년도 근속일 수 80%이상
		
		
		// 전년도 근속일 수 80%미만
		
	
//	}
	
//  ===	임시로직 끝 ===


//	@Scheduled(cron = "0 5 0 1/1 * ? *")
//	public void createAnnualLeave() {
//		// 연차생성로직
	
//	}
//	
//	@Scheduled(fixedRate=5000)
//	public void urgeUseAnnualLeave() {
//		// 연차사용 촉구서 이메일로 보내고 보내는 거 
	
//	}
//	
	
	
	/**
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
			System.out.println(workingDays);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return workingDays; 
	}
**/
}
