package com.kh.iag.resv.dao;

import java.util.List;
import java.util.Map;

import com.kh.iag.resv.entity.ResvDto;

public interface ResvDao {

	List<ResvDto> getRoomResvList(String userNo) throws Exception;
	
	List<ResvDto> getAssetResvList(String userNo) throws Exception;

}
