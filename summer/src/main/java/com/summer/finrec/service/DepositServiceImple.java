package com.summer.finrec.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.summer.finrec.comm.FinDepositSearchVO;
import com.summer.finrec.dao.FinDepositDAO;
import com.summer.finrec.domain.FinDepositVO;


@Service
public class DepositServiceImple implements DepositService {
	
	private Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private FinDepositDAO dao;
	
	@Override
	public FinDepositVO getSelectOne(FinDepositVO vo) throws SQLException {
		return dao.getSelectOne(vo);
	}


	@Override
	public List<FinDepositVO> getSelectList(FinDepositSearchVO vo) throws SQLException{
		
		return dao.getSelectList(vo);
	}


}