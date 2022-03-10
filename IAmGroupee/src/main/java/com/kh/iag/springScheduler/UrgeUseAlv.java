package com.kh.iag.springScheduler;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.kh.iag.leave.service.LeaveService;
import com.kh.iag.user.entity.UserDto;

@Component
public class UrgeUseAlv {

	@Autowired
	private LeaveService service;
	@Autowired
	private SqlSession sqlSession;

	// 전체 사원목록 구하기
	public List<UserDto> getAllUserInfo() throws Exception {

		List<UserDto> allUserInfo = service.getAllUserInfo();

		return allUserInfo;
	}
//======================================= 연차사용 촉구서 ===========================================		
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

}
