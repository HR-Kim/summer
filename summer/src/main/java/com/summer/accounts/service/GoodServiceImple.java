package com.summer.accounts.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;

import com.summer.comm.SearchVO;
import com.summer.good.dao.GoodDao;
import com.summer.good.domain.Good;
import com.summer.good.service.GoodService;

@Service
public class GoodServiceImple implements GoodService {

	@Autowired
	private PlatformTransactionManager transactionManager;
	
	@Autowired
	private GoodDao goodDao;
	
	@Override
	public List<Good> getSelectList(SearchVO vo) throws SQLException {
		return goodDao.getSelectList(vo);
	}

	@Override
	public Good get(Good good) throws SQLException {
		return goodDao.get(good);
	}

	@Override
	public List<Good> getEntp(Good good) throws SQLException {
		return goodDao.getEntp(good);
	}

}
