package com.kh.iag.resv.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iag.resv.dao.ResvDao;
import com.kh.iag.resv.entity.ResvDto;

@Service
public class ResvServiceImpl implements ResvService{

	@Autowired
	private ResvDao dao;

	@Override
	public List<ResvDto> getAllRoomResvList() throws Exception {
		return dao.getAllRoomResvList();
	}

	@Override
	public List<ResvDto> getAllAssetResvList() throws Exception {
		return dao.getAllAssetResvList();
	}
	
	
	@Override
	public List<ResvDto> getRoomList() throws Exception {
		return dao.getRoomList();
	}

	@Override
	public List<ResvDto> getAssetList() throws Exception {
		return dao.getAssetList();
	}
	
	@Override
	public List<ResvDto> getRoomResvList(String userNo) throws Exception {
		return dao.getRoomResvList(userNo);
	}

	@Override
	public List<ResvDto> getAssetResvList(String userNo) throws Exception {
		return dao.getAssetResvList(userNo);
	}

	@Override
	public int insertResv(ResvDto dto) throws Exception {
		return dao.insertResv(dto);
	}

	

}
