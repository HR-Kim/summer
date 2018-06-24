package com.summer.finfavs.service;

import java.sql.SQLException;
import java.util.List;

import com.summer.comm.SearchVO;
import com.summer.finfavs.domain.FinFavsVO;
import com.summer.finfavs.domain.FinFavsViewVO;

public interface FinFavsService {
	
	public int add(FinFavsVO vo) throws SQLException;
	
	public int delete(FinFavsVO vo) throws SQLException;
	
	public List<FinFavsViewVO> getSelectList(SearchVO vo) throws SQLException;

}