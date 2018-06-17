package com.summer.accounts.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.summer.accounts.domain.Accounts;
import com.summer.comm.SearchVO;


@Repository
public class AccountsDao {
static Logger log = Logger.getLogger(AccountsDao.class);
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private final String namespace = "com.summer.accounts.mappers";
	
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
	
	public AccountsDao() {
		
	}
	
	/**
	 * 월간 리스트 조회
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public List<Accounts> getSelectListMonth(SearchVO vo) throws SQLException{
		
		String statement = this.namespace+".do_selectListMonth";
		
		log.debug("param:"+vo.toString());
		return sqlSessionTemplate.selectList(statement, vo);
	}
	
	
	/**
	 * 일간 리스트 조회
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public List<Accounts> getSelectList(SearchVO vo) throws SQLException{
		
		String statement = this.namespace+".do_selectList";
		
		log.debug("param:"+vo.toString());
		return sqlSessionTemplate.selectList(statement, vo);
	}
	
	public Accounts get(Accounts vo) throws SQLException{
		String statement = this.namespace+".do_selectOne";
		
		log.debug("param:"+vo.toString());
		return sqlSessionTemplate.selectOne(statement, vo);
	}
	
	/**
	 * 등록/수정
	 * @param accountsVo
	 * @return
	 * @throws SQLException
	 */
	public int upsert(Accounts vo) throws SQLException{
		
		String statement = this.namespace+".do_upsert";
		
		log.debug("param:"+vo.toString());
		return sqlSessionTemplate.update(statement, vo);
	}
	
	
	public int delete(Accounts vo) throws SQLException{
		
		String statement = this.namespace+".do_delete";
		
		log.debug("param:"+vo.toString());
		return sqlSessionTemplate.delete(statement,vo);
	}

}
