package com.summer.good.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.summer.comm.SearchVO;
import com.summer.good.domain.Good;

@Repository
public class GoodDao {
	static Logger log = Logger.getLogger(GoodDao.class);
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private final String namespace = "com.summer.good.mappers";
	
	/**
	 * 초기화
	 */
	public void initmethod() {
		log.debug("================================");
		log.debug("initmethod");
		log.debug("================================");
	}
	
	/**
	 * 종료
	 */
	public void destroymethod() {
		log.debug("================================");
		log.debug("destroymethod");
		log.debug("================================");
	}
	
	public GoodDao() {
		
	}
	
	public List<Good> getSelectList(SearchVO vo) throws SQLException {
		
		String statement = this.namespace+".do_selectList";
		
		log.debug("param:"+vo.toString());
		return sqlSessionTemplate.selectList(statement, vo);
	}
	
	public Good get(Good good) throws SQLException {
		String statement = this.namespace+".do_selectOne";
		
		log.debug("param:"+good.toString());
		return sqlSessionTemplate.selectOne(statement, good);

	}
	
	public List<Good> getEntp(Good good) throws SQLException {
		String statement = this.namespace+".do_entpList";
		
		log.debug("param:"+good.toString());
		return sqlSessionTemplate.selectList(statement, good);
	}
	
	public List<Good> searchEntp(Good good) throws SQLException {
		String statement = this.namespace+".do_selectEntp";
		return sqlSessionTemplate.selectList(statement, good);
	}
}
