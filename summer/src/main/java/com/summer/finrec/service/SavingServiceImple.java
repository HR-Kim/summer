package com.summer.finrec.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.summer.finrec.comm.FinSavingSearchVO;
import com.summer.finrec.dao.FinSavingDAO;
import com.summer.finrec.domain.FinSavingVO;

@Service
public class SavingServiceImple implements SavingService {
	
	private Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private FinSavingDAO dao;
	
	public FinSavingVO getSelectOne(FinSavingVO vo) throws SQLException {
		return dao.getSelectOne(vo);
	}


	public List<FinSavingVO> getSelectList(FinSavingSearchVO vo) throws SQLException{
		
		return dao.getSelectList(vo);
	}


}
