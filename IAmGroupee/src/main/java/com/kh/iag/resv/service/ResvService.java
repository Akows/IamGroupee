package com.kh.iag.resv.service;

import java.util.List;

import com.kh.iag.resv.entity.PageVo;
import com.kh.iag.resv.entity.ResvDto;

public interface ResvService {
	
	List<ResvDto> getAllRoomResvList() throws Exception;
	
	List<ResvDto> getAllAssetResvList() throws Exception;
	
	List<ResvDto> getRoomList() throws Exception;
	
	List<ResvDto> getAssetList() throws Exception;
	
	List<ResvDto> getMyResvList(String userNo, PageVo vo) throws Exception;
	
	int insertResv(ResvDto dto) throws Exception;

	int deleteResv(String str) throws Exception;

	int returnResv(String str) throws Exception;

	int getResvCnt(String userNo) throws Exception;

	int modResv(ResvDto dto) throws Exception;

	



}
