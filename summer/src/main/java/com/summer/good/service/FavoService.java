package com.summer.good.service;

import java.sql.SQLException;
import java.util.List;

import com.summer.comm.SearchVO;
import com.summer.good.domain.Favo;

public interface FavoService {
	
	public List<Favo> getSelectList(SearchVO vo) throws SQLException;
	
	public int upsert(Favo vo) throws SQLException;
	
	public int delete(Favo vo) throws SQLException;
	
	public Favo doSum(Favo vo) throws SQLException;
	
	public int deleteAll(Favo vo) throws SQLException;

}
