package com.kh.iag.resv.dao;

import java.util.List;
import java.util.Map;

import com.kh.iag.resv.entity.ResvDto;

public interface ResvDao {

	List<ResvDto> getResvList() throws Exception;

}
