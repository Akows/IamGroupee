package com.kh.iag.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iag.board.dao.BoardDao;
import com.kh.iag.board.entity.FreeBoardDto;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDao dao;

	@Override
	public List<FreeBoardDto> getFreeBoardList() throws Exception {
		return dao.getFreeBoardList();
	}
	
	@Override // 글 등록하기
	public int freeEnroll(FreeBoardDto freeBoardDto) throws Exception {
		return dao.freeEnroll(freeBoardDto);
	}

	@Override // 등록한 게시글의 번호 알아오기
	public int getThisBoardFreeNum(String freeTitle, String userNo) throws Exception {
		return dao.getThisBoardFreeNum(freeTitle,userNo);
	}

	@Override // 자유 게시글 상세보기 // 수정하려는 글 정보가져오기
	public FreeBoardDto getFreeBoardDetail(int boardFreeNum) throws Exception {
		return dao.getFreeBoardDetail(boardFreeNum);
	}

	@Override // 수정한 글 디비에 저장
	public int updateFreeUpdate(FreeBoardDto freeBoardDto) throws Exception {
		return dao.updateFreeUpdate(freeBoardDto);
	}

	@Override // 글삭제하기
	public int freeDelete(FreeBoardDto freeBoardDto) throws Exception {
		return dao.freeDelete(freeBoardDto);
	}

	@Override // 조회수 올리기
	public int plusFreeViewCount(FreeBoardDto freeBoardDetail) throws Exception {
		return dao.plusFreeViewCount(freeBoardDetail);
	}


}
