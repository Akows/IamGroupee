package com.kh.iag.resv.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iag.resv.dao.ResvDao;
import com.kh.iag.resv.entity.ResvDto;

@Service
public class ResvServiceImpl implements ResvService{

	@Autowired
	private ResvDao dao;

	@Override
	public List<ResvDto> getRoomResvList(String userNo) throws Exception {
		return dao.getRoomResvList(userNo);
	}

	@Override
	public List<ResvDto> getAssetResvList(String userNo) throws Exception {
		return dao.getAssetResvList(userNo);
	}

}
