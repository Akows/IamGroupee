package com.kh.iag.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.iag.board.entity.FreeBoardDto;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class BoardDaoImpli implements BoardDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public List<FreeBoardDto> getFreeBoardList() throws Exception {
		return session.selectList("freeBoard.getFreeBoardList");
	}
	
	@Override
	public int freeEnroll(FreeBoardDto freeBoardDto) throws Exception {
		return session.insert("freeBoard.freeEnroll", freeBoardDto);
	}

	@Override
	public int getThisBoardFreeNum(String freeTitle, String userNo) throws Exception {
		Map<String, Object> freeNum = new HashMap<String, Object>();
		freeNum.put("userNo", userNo);
		freeNum.put("freeTitle", freeTitle);
		return session.selectOne("freeBoard.getThisBoardFreeNum", freeNum);
	}

	@Override
	public FreeBoardDto getFreeBoardDetail(int boardFreeNum) throws Exception {
		return session.selectOne("freeBoard.getFreeBoardDetail", boardFreeNum);
	}

	@Override
	public int updateFreeUpdate(FreeBoardDto freeBoardDto) throws Exception {
		return session.update("freeBoard.updateFreeUpdate", freeBoardDto);
	}

	@Override
	public int freeDelete(FreeBoardDto freeBoardDto) throws Exception {
		return session.update("freeBoard.freeDelete", freeBoardDto);
	}

	@Override
	public int plusFreeViewCount(FreeBoardDto freeBoardDetail) throws Exception {
		return session.update("freeBoard.plusFreeViewCount", freeBoardDetail);
	}
}
