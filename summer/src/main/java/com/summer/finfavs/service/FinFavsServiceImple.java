package com.summer.finfavs.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.summer.comm.SearchVO;
import com.summer.finfavs.dao.FinFavsDAO;
import com.summer.finfavs.domain.FinFavsVO;
import com.summer.finfavs.domain.FinFavsViewVO;

@Service
public class FinFavsServiceImple implements FinFavsService {

	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private FinFavsDAO dao;
	
	@Override
	public int add(FinFavsVO vo) throws SQLException {
		return dao.add(vo);
	}

	@Override
	public int delete(FinFavsVO vo) throws SQLException {
		return dao.delete(vo);
	}

	@Override
	public List<FinFavsViewVO> getSelectList(SearchVO vo) throws SQLException {
		return dao.selectList(vo);
	}

}