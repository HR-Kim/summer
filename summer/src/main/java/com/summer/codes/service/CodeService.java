package com.summer.codes.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;

import com.summer.accounts.dao.AccountsDao;
import com.summer.accounts.domain.Accounts;
import com.summer.codes.dao.CodeDao;
import com.summer.codes.domain.CodeVO;
import com.summer.comm.DTO;
import com.summer.comm.SearchVO;

@Service
public class CodeService {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private PlatformTransactionManager transactionManager;
	
	@Autowired
	private CodeDao codeDao;
	
	public List<CodeVO> getSelectList(CodeVO vo) throws SQLException {
		log.debug("CodeService" + vo.toString());
		return codeDao.getSelectList(vo);
	}
	

}
