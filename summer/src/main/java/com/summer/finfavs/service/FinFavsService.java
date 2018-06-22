package com.summer.finfavs.service;

import java.sql.SQLException;
import java.util.List;

import com.summer.comm.SearchVO;
import com.summer.finfavs.domain.FinFavsVO;

public interface FinFavsService {
	
	public int add(FinFavsVO vo) throws SQLException;
	
	public int delete(FinFavsVO vo) throws SQLException;
	
	public List<FinFavsVO> getSelectList(SearchVO vo) throws SQLException;

}