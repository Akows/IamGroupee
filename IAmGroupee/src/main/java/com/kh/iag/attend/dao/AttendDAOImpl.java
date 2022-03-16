package com.kh.iag.attend.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.iag.attend.entity.AttendDTO;
import com.kh.iag.attend.entity.AttendModDTO;
import com.kh.iag.attend.entity.AttendPageDTO;
import com.kh.iag.attend.entity.AttendWTDTO;

@Repository
public class AttendDAOImpl implements AttendDAO
{
	@Autowired
	private SqlSession ss;
	
	//메인페이지
		//근태 테이블 생성
		@Override
		public void attendtempdatainsert(AttendDTO attendDTO) throws Exception  
		{
			ss.insert("attend.attendtempdatainsert", attendDTO);	
		}
		
		@Override
		public int getAttendSeq() throws Exception 
		{
			return ss.selectOne("attend.getATseq");
		}
	
		@Override
		public void attendWTtempdatainsert(AttendWTDTO attendWTDTO) throws Exception  
		{
			ss.insert("attend.attendWTtempdatainsert", attendWTDTO);	
		}
		
		@Override
		public int attendDataCnt(AttendDTO attendDTO) throws Exception 
		{
			return ss.selectOne("attend.attendDataCnt", attendDTO);			
		}

		//메인페이지 정보 출력
		@Override
		public List<AttendDTO> getAttendInfo(AttendDTO attendDTO) throws Exception 
		{
			return ss.selectList("attend.getAttendInfo", attendDTO);
		}
		
		@Override
		public List<AttendDTO> getAttendNumandName(AttendDTO attendDTO) throws Exception 
		{
			return ss.selectList("attend.getAttendNumandName", attendDTO);
		}

		@Override
		public List<AttendDTO> getPreAttendInfo(AttendDTO attendDTO) throws Exception 
		{
			return ss.selectList("attend.getPreAttendInfo", attendDTO);
		}
	
		@Override
		public List<AttendModDTO> getAttendModInfo(AttendModDTO attendModDTO) throws Exception 
		{
			return ss.selectList("attend.getAttendModInfo", attendModDTO);
		}
	
		@Override
		public List<AttendWTDTO> getAttendWTInfo(AttendWTDTO attendWTDTO) throws Exception 
		{
			return ss.selectList("attend.getAttendWTInfo", attendWTDTO);
		}
		
		@Override
		public List<AttendWTDTO> getWTTWTInfo(AttendWTDTO attendWTDTO2) throws Exception 
		{
			return ss.selectList("attend.getWTTWTInfo", attendWTDTO2);
		}

		//춭퇴근처리
		@Override
		public int getAttendWtSeq() throws Exception 
		{
			return ss.selectOne("attend.getWTseq");
		}
		@Override
		public void attendprocessIN(AttendWTDTO attendWTDTO) 
		{
			ss.update("attend.attendprocessIN", attendWTDTO);
			ss.update("attend.attendprocessINAttend", attendWTDTO);
			ss.update("attend.attendprocessINAttend2", attendWTDTO);
		}
	
		@Override
		public void attendprocessOUT(AttendWTDTO attendWTDTO, HttpServletRequest req) 
		{
			ss.update("attend.attendprocessOUT1", attendWTDTO);
			ss.update("attend.attendprocessOUT2", attendWTDTO);
			ss.update("attend.attendprocessOUT3", attendWTDTO);
			ss.update("attend.attendprocessOUT4", attendWTDTO);
			ss.update("attend.attendprocessOUT5", attendWTDTO);
			ss.update("attend.attendprocessOUT6", attendWTDTO);
			ss.update("attend.attendprocessOUT7", attendWTDTO);
			ss.update("attend.attendprocessOUTAttend", attendWTDTO);
			ss.update("attend.attendprocessOUTAttend2", attendWTDTO);
		}
		
		@Override
		public void attendprocessReIN(AttendWTDTO attendWTDTO, HttpServletRequest req) 
		{
			ss.update("attend.attendprocessReIN", attendWTDTO);
		}

		@Override
		public void attendprocessReOUT(AttendWTDTO attendWTDTO, HttpServletRequest req) 
		{
			ss.update("attend.attendprocessReOUT", attendWTDTO);
		}
		
	
	//근태현황 조회페이지
		//캘린더
		
		//근태수정요청
		@Override
		public int getAttendmodSeq() 
		{
			return ss.selectOne("attend.getreq");
		}
	
		@Override
		public int insertattendmodify(AttendModDTO attendmodDTO) throws Exception 
		{
			return ss.insert("attend.modreq", attendmodDTO);
		}
	
		@Override
		public void uploadfile(AttendModDTO attendmodDTO) throws Exception 
		{
			ss.update("attend.modfilereq", attendmodDTO);		
		}
		@Override
		public String getWorkCheck(String attend_date) throws Exception 
		{
			return ss.selectOne("attend.getWorkCheck", attend_date);
		}

		
		//일일 근태현황조회	
		@Override
		public List<AttendDTO> getAllAttendINfo(AttendDTO attendDTO) throws Exception 
		{
			return ss.selectList("attend.getAllAttendINfo", attendDTO);
		}

		@Override
		public List<AttendWTDTO> getAllAttendWTInfo(AttendWTDTO attendWTDTO) throws Exception 
		{
			return ss.selectList("attend.getAllAttendWTInfo", attendWTDTO);
		}
		
		//일일 근태현황조회 페이징
		@Override
		public int getAttendStateCnt() throws Exception 
		{
			return ss.selectOne("attend.getAttendStateCnt");
		}
		@Override
		public List<AttendWTDTO> getWorktimeList(AttendPageDTO attendpageDTO, String userNo) throws Exception 
		{
			Map<String, Object> objectMap = new HashMap<String, Object>();
			
			int startNum = attendpageDTO.getStartRow();
			int endNum = attendpageDTO.getEndRow();
			
			objectMap.put("userNo", userNo);
			objectMap.put("startRow", startNum);
			objectMap.put("endRow", endNum);

			List<AttendWTDTO> x = ss.selectList("attend.getWorktimeList", objectMap); 

			return x;
		}
		
		//내 수정요청보기
		@Override
		public List<AttendModDTO> getMyModList(AttendModDTO attendModDTO) throws Exception 
		{
			return ss.selectList("attend.getMyModList", attendModDTO);
		}
		
		@Override
		public List<AttendModDTO> getModListSearch(AttendModDTO attendModDTO) throws Exception 
		{
			return ss.selectList("attend.getModListSearch", attendModDTO);
		}
		
		@Override
		public int checkModReq(String attend_date) throws Exception
		{
			return ss.selectOne("attend.checkModReq", attend_date);
		}
		
		
		//반려사유 보기
		@Override
		public List<AttendModDTO> getrejectReason(String attend_mod_num) throws Exception 
		{
			return ss.selectList("attend.getrejectReason", attend_mod_num);
		}
		
	//근태관리 페이지
		//수정요청 조회
		@Override
		public int getAttendModCnt() throws Exception
		{
			return ss.selectOne("attend.getAttendModCnt");
		}
	
		@Override
		public List<AttendModDTO> getModList() throws Exception 
		{
			return ss.selectList("attend.getModList");
		}
	
		//첨부파일 조회-출력
		@Override
		public List<AttendModDTO> getFile(String searchKey) throws Exception 
		{
			return ss.selectList("attend.getFile", searchKey);
		}
	
		@Override
		public AttendModDTO downloadFile(String attach_file) 
		{
			return ss.selectOne("attend.downFile", attach_file);
		}

		//수정요청처리
		@Override
		public void approveManageOK(AttendModDTO attendModDTO) throws Exception 
		{
			ss.update("attend.approveManageOK", attendModDTO);
			ss.update("attend.approveManageOKAT", attendModDTO);
			ss.update("attend.approveManageOKWT", attendModDTO);
			ss.update("attend.approveManageOKWT2", attendModDTO);			
		}
	
		@Override
		public void approveManageNone(AttendModDTO attendModDTO) throws Exception 
		{
			ss.update("attend.approveManageNone", attendModDTO);						
		}






























}