package com.summer.agecompare.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.summer.comm.SearchVO;
import com.summer.agecompare.domain.Agecompare;

@Repository
public class AgecompareDao {
	static Logger log = Logger.getLogger(AgecompareDao.class);
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private final String namespace = "com.summer.agecompare.mappers";
	public AgecompareDao() {}
	
	/**
	 * 초기화
	 */
	public void initmethod() {
		log.debug("==========================================");
		log.debug("initmethod");
		log.debug("==========================================");
	}
	
	/**
	 * 종료
	 */
	public void destroymethod() {
		log.debug("==========================================");
		log.debug("destroymethod");
		log.debug("==========================================");
	}
	
	public List<Agecompare> getSelectAgeList(SearchVO vo) throws SQLException {
		String statement = this.namespace + ".do_selectAgeList";
		log.debug("Param:" + vo.toString());
		return sqlSessionTemplate.selectList(statement, vo);
	}
}
