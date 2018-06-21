package com.summer.agecompare.service;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.PlatformTransactionManager;

import com.summer.comm.SearchVO;
import com.summer.agecompare.dao.AgecompareDao;
import com.summer.agecompare.domain.Agecompare;


@Service
public class AgecompareService {
	private Logger log = Logger.getLogger(this.getClass());
		
	@Autowired
	private AgecompareDao agecompareDao;
	
	public List<Agecompare> getSelectAgeList(SearchVO vo) throws SQLException {
		return agecompareDao.getSelectAgeList(vo);
	}
	public List<Agecompare> getSelectMeList(SearchVO vo) throws SQLException {
		return agecompareDao.getSelectMeList(vo);
	}
}