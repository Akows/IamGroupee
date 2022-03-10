package com.kh.iag.leave.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iag.leave.dao.LeaveDao;
import com.kh.iag.leave.entity.AlvOccurHistoryDto;
import com.kh.iag.leave.entity.LeaveDto;
import com.kh.iag.leave.entity.LvInfoDto;
import com.kh.iag.leave.entity.LvUsedListDto;
import com.kh.iag.leave.entity.PageVo;
import com.kh.iag.user.entity.UserDto;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class LeaveServiceImpl implements LeaveService {
	
	@Autowired
	private LeaveDao dao;
	
	@Override // 로그인유저정보
	public UserDto getThisUser(String userNo) throws Exception {
		return dao.getThisUser(userNo);
	}
	
	@Override // 메인 상단연차내역
	public UserDto getAllAlvUsage(String userNo) throws Exception {
		return dao.getAllAlvUsage(userNo);
	}
	
	@Override // 메인 사용내역
	public List<LvUsedListDto> getAllUsage(String userNo) throws Exception {
		return dao.getAllUsage(userNo);
	}
	
	@Override // 연차 사용대장
	public List<LvUsedListDto> getAlvListCalen(String userNo) throws Exception {
		return dao.getAlvListCalen(userNo);
	}

	@Override // 연차 사용대장 iframe
	public List<LvUsedListDto> getAlvList(String userNo, PageVo pageVoAlv) throws Exception {
		
		return dao.getAlvList(userNo, pageVoAlv);
	}

	@Override // 연차 사용대장 페이징
	public int getAlvRowCnt(String userNo) throws Exception {
		return dao.getAlvRowCnt(userNo);
	}
	
	@Override // 휴가 사용대장
	public List<LvUsedListDto> getLvListCalen(String userNo) throws Exception {
		return dao.getLvListCalen(userNo);
	}

	@Override // 휴가 사용대장 iframe
	public List<LvUsedListDto> getLvList(String userNo, PageVo pageVoLv) throws Exception {
		return dao.getLvList(userNo, pageVoLv);
	}

	@Override // 휴가 사용대장 페이징
	public int getLvRowCnt(String userNo) throws Exception {
		return dao.getLvRowCnt(userNo);
	}

	@Override // 휴가 발생 페이지 휴가목록
	public List<LeaveDto> getLvTypeList() throws Exception {
		return dao.getLvTypeList();
	}

	@Override // 휴가종류추가
	public int addLvType(LeaveDto leaveDto) throws Exception {
		return dao.addLvType(leaveDto);
	}

	@Override // 휴가종류삭제
	public int delLvType(String lvCode) throws Exception {
		return dao.delLvType(lvCode);
	}

	@Override // 존재하는 휴가코드인지 체크
	public LeaveDto checkExist(LeaveDto leaveDto) throws Exception {
		return dao.checkExist(leaveDto);
	}

	@Override // 게시글목록 불러오기
	public List<LvInfoDto> getLvInfoList() throws Exception {
		return dao.getLvInfoList();
	}

	@Override // 게시글 상세페이지 불러오기
	public LvInfoDto lvInfoDetail(int lvbNo) throws Exception {
		return dao.lvInfoDetail(lvbNo);
	}

	@Override // 작성한 게시글 디비에 등록
	public int lvbEnroll(LvInfoDto lvInfoDto) throws Exception {
		return dao.lvbEnroll(lvInfoDto);
	}

	@Override // 등록한 게시글의 글번호 가져오기
	public int getThisLvbNo(String title) throws Exception {
		return dao.getThisLvbNo(title);
	}

	@Override // 수정하려는 게시글의 데이터가져오기
	public LvInfoDto getThisLvbData(String lvbTitle) throws Exception {
		return dao.getThisLvbData(lvbTitle);
	}

	@Override // 수정된 내용 디비에 업데이트
	public int lvbUpdate(LvInfoDto lvInfoDto) throws Exception {
		return dao.lvbUpdate(lvInfoDto);
	}

	@Override // 게시글 삭제
	public int lvbDelete(LvInfoDto lvInfoDto) throws Exception {
		return dao.lvbDelete(lvInfoDto);
	}

	@Override // 모든 사용자의 연차 내역가져오기
	public List<UserDto> getAllUserAD(PageVo pageVo) throws Exception {
		return dao.getAllUserAD(pageVo);
	}

	@Override // 발생내역 가져오기
	public List<AlvOccurHistoryDto> getOccurHistory(String userNo) throws Exception {
		return dao.getOccurHistory(userNo);
	}

	@Override // 연차 정산
	public List<LvUsedListDto> getAlvUsageCal(String userNo) throws Exception {
		return dao.getAlvUsageCal(userNo);
	}

	@Override // 조정연차 iagUser테이블에 +
	public int iagAddAlvCount(String alvAddCount, String userNo) throws Exception {
		return dao.iagAddAlvCount(alvAddCount, userNo);
	}

	@Override // 조정연차 history테이블에 +
	public int alvOccurHistory(String alvAddCount, String userNo, String alvOccurReason) throws Exception {
		return dao.alvOccurHistory(alvAddCount, userNo, alvOccurReason);
	}

	@Override // 해당 사원번호의 사원정보 불러오기
	public List<UserDto> getThisUserAD(String searchByUserNo) throws Exception {
		return dao.getThisUserAD(searchByUserNo);
	}
	
	@Override // 해당부서의 사원정보 불러오기
	public List<UserDto> getThisDeptUserAD(String dept) throws Exception {
		return dao.getThisDeptUserAD(dept);
	}

	@Override // 관리자 메인 모든 사원의 연차 조회
	public int getRowCntAD() throws Exception {
		return dao.getRowCntAD();
	}

	@Override // 전체사원의 정보 가져오기
	public List<UserDto> getAllUserInfo() throws Exception {
		return dao.getAllUserInfo();
	}

	@Override // 작년 근무일수가 80프로가 넘는 지
	public int checkOverEighty(String userNo, String start, String end) throws Exception {
		return dao.checkOverEighty(userNo, start, end);
	}
// =========== 연차생성 전 리셋 3가지 ===========
	@Override // 1. IAG_USER의 ALV_COUNT, MLV_COUNT,  ALV_USED_COUNT, ALV_LEFT_COUNT, ALV_ADD_COUNT 컬럼 0으로 리셋 (UPDATE)
	public void resetIagUserAlv(String userNo) throws Exception {
		dao.resetIagUserAlv(userNo);
	}

	@Override // 2. ALV_OCCUR_HISTORY테이블에서 userNo의 데이터 리셋 (DELETE)
	public void resetAlvHistory(String userNo) throws Exception {
		dao.resetAlvHistory(userNo);
	}

	@Override // 3. USAGE_LV테이블 THIS_YEAR컬럼 'N'으로 리셋 (UPDATE)
	public void resetUsageLv(String userNo, String todayDate) throws Exception {
		dao.resetUsageLv(userNo, todayDate);
	}
// =========== 연차생성 ===========
	@Override // 오늘 발생한 연차가 있는지 (없어야한다)
	public int checkOccuredAlvToday(String userNo, String todayDate) throws Exception {
		return dao.checkOccuredAlvToday(userNo, todayDate);
	}

	@Override // 로그인 유저의 총연차개수 update IAG_USER
	public int addAlvCount(String userNo, int createAlvCount) throws Exception {
		return dao.addAlvCount(userNo, createAlvCount);
	}

	@Override // 로그인 유저의 연차발생 HISTORY
	public int addAlvHistory(String userNo, int createAlvCount) throws Exception {
		return dao.addAlvHistory(userNo, createAlvCount);
	}
// =========== 월차생성 ===========	

	@Override // 오늘 발생한 월차가 있는지 (없어야한다)
	public int checkOccurMlvToday(String userNo, String todayDate) throws Exception {
		return dao.checkOccurMlvToday(userNo, todayDate);
	}

	@Override // 이전 달에 개근을 했는지 (했어야한다)
	public int checkAttendAll(String userNo, String todayDate) throws Exception {
		return dao.checkAttendAll(userNo, todayDate);
	}

	@Override// 로그인 유저의 총월차개수 update +1 IAG_USER
	public int addMlvCount(String userNo) throws Exception {
		return dao.addMlvCount(userNo);
	}

	@Override // 로그인 유저의 월차발생 HISTORY
	public int addMlvHistory(String userNo) throws Exception {
		return dao.addMlvHistory(userNo);
	}

}
