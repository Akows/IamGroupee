package com.kh.iag.resv.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iag.resv.dao.ResvMgtDao;
import com.kh.iag.resv.entity.AssetDto;
import com.kh.iag.resv.entity.RoomDto;

@Service
public class ResvMgtServiceImpl implements ResvMgtService {

	@Autowired
	private ResvMgtDao dao;
	
	@Override
	public List<RoomDto> getRoomList(Map<String, String> filter) throws Exception {
		return dao.getRoomList(filter);
	}
	
	@Override
	public List<AssetDto> getAssetList(Map<String, String> filter) throws Exception {
		return dao.getAssetList(filter);
	}
	
	@Override
	public void insertRoom(RoomDto dto) throws Exception {
		if(dto.getActivateYn() == "true") {
			dto.setActivateYn("Y");	
			dto.setReserved("N");
		}else {
			dto.setActivateYn("N");
			dto.setReserved("N");
		}
		  
		dao.insertRoom(dto);
	}
	
	@Override
	public void insertAsset(AssetDto dto) throws Exception {
		if(dto.getActivateYn() == "true") {
			dto.setActivateYn("Y");	
			dto.setReserved("N");
		}else {
			dto.setActivateYn("N");
			dto.setReserved("N");
		}
		 
		dao.insertAsset(dto);
	}
	
	@Override
	public void updateRoom(RoomDto dto) throws Exception {
		if(dto.getActivateYn() == "true") {
			dto.setActivateYn("Y");	
			dto.setReserved("N");
		}else {
			dto.setActivateYn("N");
			dto.setReserved("N");
		}
		 
		dao.updateRoom(dto);
	}
	
	@Override
	public void updateAsset(AssetDto dto) throws Exception {
		if(dto.getActivateYn() == "true") {
			dto.setActivateYn("Y");	
			dto.setReserved("N");
		}else {
			dto.setActivateYn("N");
			dto.setReserved("N");
		}
		
		dao.updateAsset(dto);
	}
	
	@Override
	public void deleteRoom(int roomNo) throws Exception {
		dao.deleteRoom(roomNo);
	}
	
	@Override
	public void deleteAsset(int assetNo) throws Exception {
		dao.deleteAsset(assetNo);
	}
}
