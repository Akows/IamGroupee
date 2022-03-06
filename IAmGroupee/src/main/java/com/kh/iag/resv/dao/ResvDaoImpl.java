package com.kh.iag.resv.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.iag.resv.entity.ResvDto;

@Repository
public class ResvDaoImpl implements ResvDao {

	@Autowired
	private SqlSession ss;

	@Override
	public List<ResvDto> getRoomResvList(String userNo) throws Exception {
		return ss.selectList("resv.getRoomResvList", userNo);
	}

	@Override
	public List<ResvDto> getAssetResvList(String userNo) throws Exception {
		return ss.selectList("resv.getAssetResvList", userNo);
	}

}
