package com.kh.iag.resv.service;

import java.util.List;
import java.util.Map;

import com.kh.iag.resv.entity.ResvDto;

public interface ResvService {

	List<ResvDto> getRoomResvList(String userNo) throws Exception;
	
	List<ResvDto> getAssetResvList(String userNo) throws Exception;

}
