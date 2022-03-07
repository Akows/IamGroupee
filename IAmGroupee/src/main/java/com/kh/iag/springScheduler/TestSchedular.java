package com.kh.iag.springScheduler;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.iag.leave.dao.LeaveDao;
import com.kh.iag.leave.entity.AlvOccurHistoryDto;
import com.kh.iag.leave.entity.LeaveDto;
import com.kh.iag.leave.service.LeaveService;
import com.kh.iag.user.entity.UserDto;

@Component
public class TestSchedular {

	
/**
	@Autowired
	private LeaveService service;
	@Autowired
	private LeaveDao dao;
	
	// 전체 사원목록 구하기
	
	public List<UserDto> getAllUserInfo() throws Exception {
		
		List<UserDto> allUserInfo = service.getAllUserInfo();
		
		return allUserInfo;
	}
	
	
	
	// 연차사용 촉구서 이메일로 보내고 보내는 거 
	@Scheduled(cron = "0 30 0 1/1 * *")
	public void urgeUseAnnualLeave() throws Exception {
		List<UserDto> allUserInfo = getAllUserInfo();
		
		for (UserDto userDto : allUserInfo) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-M-d");
			Calendar today = Calendar.getInstance(); 
			String todayDate = format.format(today.getTime()); // 오늘 날짜"yyyy-M-d"
			String enrollDate = String.valueOf(format.format(userDto.getEnrollDate()));// 입사 날짜"yyyy-M-d"
			
		}
		
		
	}
	@Scheduled(cron = "")
	public void teest() throws Exception {
		AlvOccurHistoryDto historyDto = new AlvOccurHistoryDto();
		historyDto.setUserNo("2222");
		historyDto.setLvCode("ALV_05");
		historyDto.setAlvOccurCount(1);
		historyDto.setAlvOccurReason("스케쥴러 테스트");;
		
		dao.Test(historyDto);
		System.out.println("테스트실행됨");
	}
**/
	
	
//	@Scheduled(cron = "0 1 0 1/1 * ? *")
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
