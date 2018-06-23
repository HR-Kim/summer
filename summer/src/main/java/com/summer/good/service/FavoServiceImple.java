package com.summer.good.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.summer.comm.SearchVO;
import com.summer.good.dao.FavoDao;
import com.summer.good.domain.Favo;

@Service
public class FavoServiceImple implements FavoService{
	
	@Autowired
	private FavoDao favoDao;

	@Override
	public List<Favo> getSelectList(SearchVO vo) throws SQLException {
		return favoDao.getSelectLIst(vo);
	}

	@Override
	public int upsert(Favo vo) throws SQLException {
		
		return favoDao.upsert(vo);
	}

	@Override
	public int delete(Favo vo) throws SQLException {
		
		return favoDao.delete(vo);
	}

	@Override
	public Favo doSum(Favo vo) throws SQLException {
		return favoDao.doSum(vo);
	}

	@Override
	public int deleteAll(Favo vo) throws SQLException {
		return favoDao.deleteAll(vo);
	}

}
