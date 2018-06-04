package com.summer.finfavs.dao;

import java.sql.SQLException;
import java.util.List;

import com.summer.comm.SearchVO;
import com.summer.finfavs.domain.FinFavs;


public interface FinFavsDao {
	
	public int delete(FinFavs finFavs) throws SQLException;

	public int add(FinFavs finFavs) throws SQLException;
	
	public List<FinFavs> selectList(SearchVO searchVO) throws SQLException;
	
}
