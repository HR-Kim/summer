package com.summer.finrec.service;

import java.sql.SQLException;
import java.util.List;

import com.summer.comm.SearchVO;

public interface FinRecService {
	
	public List<String> getSelectList(SearchVO vo) throws SQLException;
	
	public String getSelectOne(SearchVO vo) throws SQLException;

}
