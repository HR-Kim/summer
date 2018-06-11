package com.summer.chart.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.summer.chart.domain.Chart;

@Repository
public class ChartDao {
	static Logger log = Logger.getLogger(ChartDao.class);
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private final String namespace = "com.summer.chart.mappers";
	
	/**
	 * 초기화
	 */
	public void initmethod() {
		log.debug("=================================================");
		log.debug("initmethod");
		log.debug("=================================================");
	}
	
	/**
	 * 종료
	 */
	public void destroymethod() {
		log.debug("=================================================");
		log.debug("destroymethod");
		log.debug("=================================================");
	}
	
	public ChartDao() { }
	
	public List<Chart> getCtgList(Chart vo) throws SQLException{	//카테고리 별 리스트(파이 차트)
		String statement = this.namespace + ".doCtglist";
		log.debug("ID: " + vo.getChartUserId());
		log.debug("*******************************");
		return sqlSessionTemplate.selectList(statement, vo);
	}
}