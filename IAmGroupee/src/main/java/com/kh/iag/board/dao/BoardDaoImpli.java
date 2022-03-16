package com.kh.iag.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.iag.board.entity.FreeBoardDto;
import com.kh.iag.board.entity.NoticeBoardDto;
import com.kh.iag.board.entity.PageVo;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class BoardDaoImpli implements BoardDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public List<FreeBoardDto> getFreeBoardList(PageVo pageVoFree) throws Exception {
		return session.selectList("board.getFreeBoardList", pageVoFree);
	}

	@Override
	public int getFreeRowCnt() throws Exception {
		return session.selectOne("board.getFreeRowCnt");
	}
	
	@Override
	public int freeEnroll(FreeBoardDto freeBoardDto) throws Exception {
		return session.insert("board.freeEnroll", freeBoardDto);
	}

	@Override
	public int getThisBoardFreeNum(String freeTitle, String userNo) throws Exception {
		Map<String, Object> freeNum = new HashMap<String, Object>();
		freeNum.put("userNo", userNo);
		freeNum.put("freeTitle", freeTitle);
		return session.selectOne("board.getThisBoardFreeNum", freeNum);
	}

	@Override
	public FreeBoardDto getFreeBoardDetail(int boardFreeNum) throws Exception {
		return session.selectOne("board.getFreeBoardDetail", boardFreeNum);
	}

	@Override
	public int updateFreeUpdate(FreeBoardDto freeBoardDto) throws Exception {
		return session.update("board.updateFreeUpdate", freeBoardDto);
	}

	@Override
	public int freeDelete(FreeBoardDto freeBoardDto) throws Exception {
		return session.update("board.freeDelete", freeBoardDto);
	}

	@Override
	public int plusFreeViewCount(int boardFreeNum) throws Exception {
		return session.update("board.plusFreeViewCount", boardFreeNum);
	}

	@Override
	public List<FreeBoardDto> getMainFreeBoardList() throws Exception {
		return session.selectList("board.getMainFreeBoardList");
	}
///////////////////////////////////////////////////////////////////////////////////////
	@Override
	public List<NoticeBoardDto> getNoticeBoardList(PageVo pageVoNotice) throws Exception {
		return session.selectList("board.getNoticeBoardList", pageVoNotice);
	}
	
	@Override
	public int plusNoticeViewCount(int noticeNum) throws Exception {
		return session.update("board.plusNoticeViewCount", noticeNum);
	}

	@Override
	public NoticeBoardDto getNoticeBoardDetail(int noticeNum) throws Exception {
		return session.selectOne("board.getNoticeBoardDetail", noticeNum);
	}

	@Override
	public int noticeEnroll(NoticeBoardDto noticeBoardDto) throws Exception {
		return session.insert("board.noticeEnroll", noticeBoardDto);
	}

	@Override
	public int getThisBoardNoticeNum(String noticeTitle, String userNo) throws Exception {
		Map<String, Object> noticeNum = new HashMap<String, Object>();
		noticeNum.put("userNo", userNo);
		noticeNum.put("noticeTitle", noticeTitle);
		return session.selectOne("board.getThisBoardNoticeNum", noticeNum);
	}

	@Override
	public int updateNoticeUpdate(NoticeBoardDto noticeBoardDto) throws Exception {
		return session.update("board.updateNoticeUpdate", noticeBoardDto);
	}

	@Override
	public int noticeDelete(int noticeNum) throws Exception {
		return session.update("board.noticeDelete", noticeNum);
	}

	@Override
	public List<NoticeBoardDto> getMainNoticeBoardList() throws Exception {
		return session.selectList("board.getMainNoticeBoardList");
	}

	@Override
	public int getNoticeRowCnt() throws Exception {
		return session.selectOne("board.getNoticeRowCnt");
	}
}
