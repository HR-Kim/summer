package com.summer.good.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.summer.comm.SearchVO;
import com.summer.good.domain.Favo;

@Repository
public class FavoDao {
	static Logger log = Logger.getLogger(FavoDao.class);
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private final String namespace = "com.summer.favo.mappers";
	
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
	
	public FavoDao() {
		
	}
	
	public List<Favo> getSelectLIst(SearchVO vo) throws SQLException {
		
		String statement = this.namespace+".do_selectList";
		
		log.debug("param:"+vo.toString());
		return sqlSessionTemplate.selectList(statement, vo);
	}
	
	public int upsert(Favo vo) throws SQLException{
		
		String statement = this.namespace+".do_upsert";
		
		log.debug("param:"+vo.toString());
		return sqlSessionTemplate.update(statement, vo);
	}
	
	public int delete(Favo vo) throws SQLException{
		String statement = this.namespace+".do_delete";
		
		log.debug("param:"+vo.toString());
		return sqlSessionTemplate.delete(statement,vo);
	}
	
	public Favo doSum(Favo vo) throws SQLException{
		String statement = this.namespace+".do_sum";
		
		log.debug("param:"+vo.toString());
		return sqlSessionTemplate.selectOne(statement, vo);
		
	}
	
	public int deleteAll(Favo vo) throws SQLException{
		String statement = this.namespace+".do_deleteAll";
		log.debug("param:"+vo.toString());
		return sqlSessionTemplate.delete(statement,vo);
	}
	
	
	
}
