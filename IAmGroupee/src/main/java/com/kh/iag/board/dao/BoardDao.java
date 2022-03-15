package com.kh.iag.board.dao;

import java.util.List;

import com.kh.iag.board.entity.FreeBoardDto;

public interface BoardDao {

	int freeEnroll(FreeBoardDto freeBoardDto) throws Exception;

	int getThisBoardFreeNum(String freeTitle, String userNo) throws Exception;

	FreeBoardDto getFreeBoardDetail(int boardFreeNum) throws Exception;

	List<FreeBoardDto> getFreeBoardList() throws Exception;

	int updateFreeUpdate(FreeBoardDto freeBoardDto) throws Exception;

	int freeDelete(FreeBoardDto freeBoardDto) throws Exception;

	int plusFreeViewCount(FreeBoardDto freeBoardDetail) throws Exception;

}
