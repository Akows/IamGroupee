package com.kh.iag.resv.service;

import java.util.List;

import com.kh.iag.resv.entity.ResvDto;

public interface ResvService {

	List<ResvDto> getRoomResvList(String userNo) throws Exception;
	
	List<ResvDto> getAssetResvList(String userNo) throws Exception;

	int insertResv(ResvDto dto) throws Exception;

	List<ResvDto> getRoomList() throws Exception;

	List<ResvDto> getAssetList() throws Exception;

}
