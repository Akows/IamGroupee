package com.kh.iag.springScheduler;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import com.kh.iag.leave.service.LeaveService;
import com.kh.iag.user.entity.UserDto;

@Component
public class OccurAlvSchedular {

	@Autowired
	private LeaveService service;
	
	// 전체 사원목록 구하기
	public List<UserDto> getAllUserInfo() throws Exception {
		List<UserDto> allUserInfo = service.getAllUserInfo();
		return allUserInfo;
	}

	@Scheduled(cron = "0 0 0 * * *")
	public void createAnnualLeave() throws Exception {

		List<UserDto> allUserInfo = getAllUserInfo();
		//		연차생성로직
		for (UserDto userDto : allUserInfo) {
			String userNo = userDto.getUserNo();
//			============입사일 기준 연차 발생
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Calendar today = Calendar.getInstance(); 

			// 현재날짜의 년월일
			String todayDate = format.format(today.getTime()); // 오늘 날짜"yyyy-MM-dd"
			String todayYear = todayDate.split("-")[0]; // 현재날짜의 연도"YYYY"
			int toYear = Integer.parseInt(todayYear); // 현재날짜의 연도"YYYY"
			String todayMonth = todayDate.split("-")[1]; // 현재날짜의 월"MM"
			String todayDay = todayDate.split("-")[2]; // 현재날짜의 일"dd"
			String todayMonthDate = todayMonth + "-" + todayDay; // 현재날짜의 월일"MM-dd"
			
			// 입사일의 년월일
			String enrollDate = String.valueOf(format.format(userDto.getEnrollDate()));// 입사 날짜"yyyy-MM-dd"
			String enrollMonth = enrollDate.split("-")[1]; // 입사월"MM"
			int enMonth = Integer.parseInt(enrollMonth); // 입사월"MM"
			String enrollDay = enrollDate.split("-")[2]; // 입사일"dd"
			String enrollMonthDate = enrollMonth + "-" + enrollDay; // 입사 월일"MM-dd"
//==============연차발생로직 시작==============
			
//--------- 조건1. 현재날짜 - 입사일 ==> 1년 미만/이상
			Date todayNow = new SimpleDateFormat("yyyy-MM-dd").parse(todayDate);
			Date enroll = new SimpleDateFormat("yyyy-MM-dd").parse(enrollDate);
			int createAlvCount= 0;
			int isValidate= 0;

			Calendar todayCal = Calendar.getInstance();
			todayCal.setTime(todayNow);
			Calendar enrollCal = Calendar.getInstance();
			enrollCal.setTime(enroll);

			// 근무연차
			long diffYears = ((todayCal.getTimeInMillis() - enrollCal.getTimeInMillis()) / 1000) / (24*60*60*30*12);
			//일자수 차이
			long diffDays = ((todayCal.getTimeInMillis() - enrollCal.getTimeInMillis()) / 1000) / (24*60*60);

			switch (Long.valueOf(Optional.ofNullable(diffYears).orElse(0L)).intValue()) {
			case 1: case 2: case 3:
				createAlvCount = 15;
				break;
			case 4: case 5:
				createAlvCount = 16;
				break;
			case 6: case 7:
				createAlvCount = 17;
				break;
			case 8: case 9:
				createAlvCount = 18;
				break;
			case 10: case 11:
				createAlvCount = 19;
				break;
			case 12: case 13:
				createAlvCount = 20;
				break;
			case 14: case 15:
				createAlvCount = 21;
				break;
			case 16: case 17:
				createAlvCount = 22;
				break;
			case 18: case 19:
				createAlvCount = 23;
				break;
			case 20: case 21:
				createAlvCount = 24;
				break;
			}
			if (Long.valueOf(Optional.ofNullable(diffYears).orElse(0L)).intValue() >= 22) {
				createAlvCount = 25;
			}
			
//========= 근무연수 1년 이상
			if (diffDays >= 365) {
				String start = (toYear-1) + "-" + enrollMonthDate;
				String end = todayYear + "-" + enrollMonthDate;
				// 평일 수
				int workingDaysOfYear = checkWorkingDays(start, end);
				
				int result = service.checkOverEighty(userNo, start, end);
				
//--------- 전년도 근속일수 80% 이상 -> 조건2 (연차)				
				if (result >= (workingDaysOfYear/10)*8) {
					
			// 조건2. 연차조건
					isValidate = conditionAlv(todayDate, todayMonthDate, enrollMonthDate, userNo, createAlvCount);
					if (isValidate == 1) {
						System.out.println(userNo);
					} else if (isValidate == 0) {
						System.out.println(userNo);
					}
					
//--------- 전년도 근속일수 80% 미만 -> 조건3 (월차)							
				} else {
			// 조건3. 월차조건
					isValidate = conditionMlv(enrollMonthDate, todayMonthDate, todayDate, enrollDay, userNo, enMonth, enrollDate);
					if (isValidate == 1) {
						System.out.println(userNo);
					} else if (isValidate == 0) {
						System.out.println(userNo);
					}
				}
				
//========= 근무연수 1년 미만 -> 조건3 (월차)						
			} else {
			// 조건3. 월차조건
				isValidate = conditionMlv(enrollMonthDate, todayMonthDate, todayDate, enrollDay, userNo, enMonth, enrollDate);
				if (isValidate == 1) {
					System.out.println(userNo);
				} else if (isValidate == 0) {
					System.out.println(userNo);
				}
			}
		}
	}//=========================================================createAnnualLeave끝
	
	
//==========================연차 생성 시 호출할 메소드==========================
//== 조건2. 연차조건
	public int conditionAlv(String todayDate, String todayMonthDate, String enrollMonthDate, String userNo, int createAlvCount) throws Exception {
		int isValidate= 0;
		// 오늘 발생한 연차가 있는지 (없어야한다)
		int occurToday = service.checkOccuredAlvToday(userNo, todayDate);

		if (todayMonthDate.equals(enrollMonthDate) && occurToday == 0) {
			// 리셋
			resetAlvData(todayDate, userNo);
			System.out.println("173리셋됨");
			// 로그인 유저의 총월차개수 update +1 IAG_USER
			int result1 = service.createAlvCount(userNo, createAlvCount);
			// 로그인 유저의 연차발생 HISTORY
			int result2 = service.addAlvHistory(userNo, createAlvCount);
			
			if (result1 > 0 && result2 > 0) {
				isValidate = 1;
			} else {
				isValidate = 0;
			}
		} 
			return isValidate;
	}

//== 조건3. 월차조건	
	public int conditionMlv(String enrollMonthDate,String todayMonthDate, String todayDate, String enrollDay, String userNo, int enMonth, String enrollDate) throws Exception {

		
		int isValidate = 0;

		switch (enMonth) {
		case 3: case 4: case 5: case 6: case 7: case 8: case 9: case 10:
			for (int i = 1; i < 12 - enMonth; i++) {
				String dueDate = AddDate("MM-dd",enrollMonthDate,0,i,0);
				isValidate = checkMlvPossibility(dueDate, todayMonthDate, todayDate, userNo, enrollDate);
			}
			for (int i = enMonth - 1; i > 0; i--) {
				String dueDate = AddDate("MM-dd",enrollMonthDate,0,-i,0);
				isValidate = checkMlvPossibility(dueDate,todayMonthDate, todayDate, userNo, enrollDate);
			}
			break;
			
		case 1:
			for (int i = 1; i < 12 - enMonth; i++) {
				String dueDate = AddDate("MM-dd",enrollMonthDate,0,i,0);
				isValidate = checkMlvPossibility(dueDate,todayMonthDate, todayDate, userNo, enrollDate);
			}
			break;
			
		case 2:
			for (int i = 1; i < 12 - enMonth; i++) {
				String dueDate = AddDate("MM-dd",enrollMonthDate,0,i,0);
				isValidate = checkMlvPossibility(dueDate,todayMonthDate, todayDate, userNo, enrollDate);
			}
			if (todayMonthDate.equals("01" + "-" + enrollDay)) {
				// 오늘 발생한 월차가 있는지 (없어야한다)
				int occurToday = service.checkOccurMlvToday(userNo, todayDate);
				// 이전 달에 개근을 했는지 (했어야한다)
				int attendAll = service.checkAttendAll(userNo, todayDate);
				
				if (occurToday == 0 && attendAll == 1) {
					// 로그인 유저의 총월차개수 update +1 IAG_USER
					int result1 = service.addMlvCount(userNo);
					// 로그인 유저의 월차발생 HISTORY
					int result2 = service.addMlvHistory(userNo);
					
					if (result1 > 0 && result2 > 0) {
						isValidate = 1;
					}else {
						isValidate = 0;
					}
				}
			}
			break;
			
		case 11:
			for (int i = enMonth - 1; i > 0; i--) {
				String dueDate = AddDate("MM-dd",enrollMonthDate,0,-i,0);
				isValidate = checkMlvPossibility(dueDate,todayMonthDate, todayDate, userNo, enrollDate);
			}
			if (todayMonthDate.equals("12" + "-" + enrollDay)) {
				// 오늘 발생한 월차가 있는지 (없어야한다)
				int occurToday = service.checkOccurMlvToday(userNo, todayDate);
				// 이전 달에 개근을 했는지 (했어야한다)
				int attendAll = service.checkAttendAll(userNo, todayDate);
				
				if (occurToday == 0 && attendAll == 1) {
					// 로그인 유저의 총월차개수 update +1 IAG_USER
					int result1 = service.addMlvCount(userNo);
					// 로그인 유저의 월차발생 HISTORY
					int result2 = service.addMlvHistory(userNo);
					
					if (result1 > 0 && result2 > 0) {
						isValidate = 1;
					}else {
						isValidate = 0;
					}
				}
			}
			break;
			
		case 12:
			for (int i = enMonth - 1; i > 0; i--) {
				String dueDate = AddDate("MM-dd",enrollMonthDate,0,-i,0);
				isValidate = checkMlvPossibility(dueDate,todayMonthDate, todayDate, userNo, enrollDate);
			}
			break;
		}
		return isValidate;
	}
	
//  월차가 발생할 수 있는 조건인지 체크해주는 메소드
	public int checkMlvPossibility(String dueDate, String todayMonthDate, String todayDate, String userNo, String enrollDate) throws Exception {
		int isValidate = 0;
		// 평일 수
		if (todayMonthDate.equals(dueDate) && !todayDate.equals(enrollDate)) {
			int workingDays = checkWorkingDays(AddDate("yyyy-MM-dd", todayDate, 0, -1, 0), AddDate("yyyy-MM-dd", todayDate, 0, 0, -1));
			System.out.println("workingDays : " + workingDays);
			// 리셋
			resetAlvData(todayDate, userNo);
			// 오늘 발생한 월차가 있는지 (없어야한다)
			int occurToday = service.checkOccurMlvToday(userNo, todayDate);
			// 이전 달에 개근을 했는지 (했어야한다) -- NORMAL_CHECK가 'Y'인 컬럼의 수가 평일 수와 같아야한다
			int attendAll = service.checkAttendAll(userNo, todayDate);
			System.out.println("occurToday : " + occurToday + "//attendAll : " + attendAll);
			if (occurToday == 0 && attendAll == workingDays) {
				// 로그인 유저의 총월차개수 update +1 IAG_USER
				int result1 = service.addMlvCount(userNo);
				// 로그인 유저의 월차발생 HISTORY
				int result2 = service.addMlvHistory(userNo);
				
				if (result1 == 1 && result2 == 1) {
					isValidate = 1;
				}else {
					isValidate = 0;
				}
			}
		}
		return isValidate;
	}
	
//	리셋할 데이터 3가지
	public int resetAlvData(String todayDate, String userNo) throws Exception {
		
		int result = 0;
		
		// 1. IAG_USER의 ALV_COUNT, MLV_COUNT,  ALV_USED_COUNT, ALV_LEFT_COUNT, ALV_ADD_COUNT 컬럼 0으로 리셋 (UPDATE)
		int con1 = service.resetIagUserAlv(userNo);
		
		// 2. ALV_OCCUR_HISTORY테이블에서 userNo의 데이터 리셋 리셋 (DELETE)
		int con2 = service.resetAlvHistory(userNo);
		
		// 3. USAGE_LV테이블 THIS_YEAR컬럼 'N'으로 리셋 (UPDATE)
		int con3 = service.resetUsageLv(userNo, todayDate);
		
		if(con1 == 1 && con2 == 1 && con3 == 1 ) {
			result = 1;
			return result;
		}
		return result;
		
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

	// 지정한 수만큼씩 증가/감소하는 날짜
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
