package com.summer.agecompare.service;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import javax.sql.DataSource;
import java.sql.SQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.PlatformTransactionManager;

import com.summer.agecompare.dao.AgecompareDao;
import com.summer.agecompare.domain.Agecompare;


@Service
public class AgecompareService {
	private Logger log = Logger.getLogger(this.getClass());
	
	private DataSource dataSource;

	@Autowired
	private PlatformTransactionManager transactionManager;
	
	@Autowired
	private AgecompareDao agecompareDao;
	
		public Agecompare get(Agecompare agecompare) throws SQLException {
		return agecompareDao.get(agecompare);
	}
}
