package com.summer.accounts.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;

import com.summer.accounts.dao.AccountsDao;
import com.summer.accounts.domain.Accounts;
import com.summer.comm.SearchVO;

@Service
public class AccountsServiceImple {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private PlatformTransactionManager transactionManager;
	
	@Autowired
	private AccountsDao accountsDao;
	
	public List<Accounts> getSelectListWeek(SearchVO vo) throws SQLException {
		return accountsDao.getSelectListWeek(vo);
	}
	
	public List<Accounts> getSelectListMonth(SearchVO vo) throws SQLException {
		return accountsDao.getSelectListMonth(vo);
	}
	
	public List<Accounts> getSelectList(SearchVO vo) throws SQLException {
		return accountsDao.getSelectList(vo);
	}
	
	public Accounts get(Accounts vo) throws SQLException {
		return accountsDao.get(vo);
	}

	public int upsert(Accounts vo) throws SQLException {
		return accountsDao.upsert(vo);
	}

	public int delete(Accounts vo) throws SQLException {
		return accountsDao.delete(vo);
				
	}

}
