package com.summer.finfavs.dao;

import java.sql.SQLException;
import java.util.List;

import com.summer.comm.SearchVO;
import com.summer.finfavs.domain.FinFavsVO;


public interface FinFavsDao {
	
	public int delete(FinFavsVO finFavs) throws SQLException;

	public int add(FinFavsVO finFavs) throws SQLException;
	
	public List<FinFavsVO> selectList(SearchVO searchVO) throws SQLException;
	
}
