package com.summer.chart.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;

import com.summer.chart.dao.ChartDao;
import com.summer.chart.domain.Chart;

@Service
public class ChartService {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private PlatformTransactionManager transactionManager;
	
	@Autowired
	private ChartDao chartDao;
	
	/**
	 * 카테고리 별 리스트 조회
	 * @throws SQLException 
	 */
	
	public List<Chart> getCtgList(Chart vo) throws SQLException {
		return chartDao.getCtgList(vo);
	}
	
	public List<Chart> getCtgChart(Chart vo) throws SQLException{
		return chartDao.getCtgChart(vo);
	}
}