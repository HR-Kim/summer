package com.summer.good.service;

import java.sql.SQLException;
import java.util.List;

import com.summer.comm.SearchVO;
import com.summer.good.domain.Good;

public interface GoodService {
	
	public List<Good> getSelectList(SearchVO vo) throws SQLException;
	
	public Good get(Good good) throws SQLException;
	
	public List<Good> getEntp(Good good) throws SQLException;
	
	public List<Good> searchEntp(Good good) throws SQLException;
}
