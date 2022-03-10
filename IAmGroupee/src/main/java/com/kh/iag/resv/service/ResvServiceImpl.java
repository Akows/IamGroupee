package com.kh.iag.resv.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iag.resv.dao.ResvDao;
import com.kh.iag.resv.entity.PageVo;
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
	public List<ResvDto> getMyResvList(String userNo, PageVo vo) throws Exception {
		return dao.getMyResvList(userNo, vo);
	}

	@Override
	public int insertResv(ResvDto dto) throws Exception {
		return dao.insertResv(dto);
	}

	@Override
	public int deleteResv(String str) throws Exception {
		String[] delArr = str.split(",");
		return dao.deleteResv(delArr);
	}

	@Override
	public int returnResv(String str) throws Exception {
		String[] delArr = str.split(",");
 		return dao.returnResv(delArr);
	}

	@Override
	public int getResvCnt(String userNo) throws Exception {
		return dao.getResvCnt(userNo);
	}

	@Override
	public int modResv(ResvDto dto) throws Exception {
		return dao.modResv(dto);
	}

	

}
