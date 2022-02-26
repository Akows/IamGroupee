package com.kh.iag.leave.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iag.leave.dao.LeaveDao;
import com.kh.iag.leave.entity.LeaveDto;
import com.kh.iag.leave.entity.LvInfoDto;
import com.kh.iag.leave.entity.LvUsedListDto;

@Service
public class LeaveServiceImpl implements LeaveService {
	
	@Autowired
	private LeaveDao dao;
	
	@Override // 메인 사용내역
	public List<LvUsedListDto> getAllUsage(String userNo) throws Exception {
		return dao.getAllUsage(userNo);
	}

	@Override // 연차 사용대장
	public List<LvUsedListDto> getAlvList(String userNo) throws Exception {
		return dao.getAlvList(userNo);
	}

	@Override // 페이징
	public int getAlvRowCnt(String userNo) throws Exception {
		return dao.getAlvRowCnt(userNo);
	}

	@Override // 휴가 사용대장
	public List<LvUsedListDto> getLvList(String userNo) throws Exception {
		return dao.getLvList(userNo);
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

	
	
}
