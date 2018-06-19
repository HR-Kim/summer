package com.summer.accounts.service;

import java.sql.SQLException;
import java.util.List;

import com.summer.accounts.domain.Accounts;
import com.summer.comm.SearchVO;

public interface AccountsService {
	
	public List<Accounts> getSelectListWeek(SearchVO vo) throws SQLException;
	
	public List<Accounts> getSelectListMonth(SearchVO vo) throws SQLException;
	
	public List<Accounts> getSelectList(SearchVO vo) throws SQLException;
	
	public Accounts get(Accounts vo) throws SQLException;

	public int upsert(Accounts vo) throws SQLException;

	public int delete(Accounts vo) throws SQLException; 
}
