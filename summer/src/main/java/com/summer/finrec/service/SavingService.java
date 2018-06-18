package com.summer.finrec.service;

import java.sql.SQLException;
import java.util.List;

import com.summer.finrec.comm.FinSavingSearchVO;
import com.summer.finrec.domain.FinSavingVO;


public interface SavingService {

	
	/**
	 * 단건상세조회
	 * @param FinSavingVO
	 * @return
	 */
	public FinSavingVO getSelectOne(String finPrdtCd);
	
	
	/**
	 * 목록 조회
	 * @param vo
	 * @return List<FinSavingVO>
	 */
	public List<FinSavingVO> getSelectList(FinSavingSearchVO vo);
	
}
