package com.summer.finrec.service;

import java.sql.SQLException;
import java.util.List;

import com.summer.finrec.comm.FinDepositSearchVO;
import com.summer.finrec.domain.FinDepositVO;


public interface DepositService {

	
	/**
	 * 단건상세조회
	 * @param FinDepositVO
	 * @return
	 */
	public FinDepositVO getSelectOne(FinDepositVO vo) throws SQLException;
	
	
	/**
	 * 목록 조회
	 * @param vo
	 * @return List<FinDepositVO>
	 */
	public List<FinDepositVO> getSelectList(FinDepositSearchVO vo) throws SQLException;
	
}