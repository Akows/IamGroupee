package com.kh.iag.prj.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.iag.prj.entity.PrjDto;

@Repository
public class PrjDaoImpl implements PrjDao{
	
	@Autowired
	private SqlSession ss;

	@Override
	public int createPrj(PrjDto dto) throws Exception {
		return ss.insert("prj.createPrj", dto);
	}

}
