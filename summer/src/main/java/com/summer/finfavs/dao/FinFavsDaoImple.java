package com.summer.finfavs.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.summer.comm.SearchVO;
import com.summer.finfavs.domain.FinFavsVO;

@Repository
public class FinFavsDaoImple implements FinFavsDao {
	
	static Logger log = Logger.getLogger(FinFavsDao.class);
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private final String nameSpace = "com.summer.finfavs.mappers";

	/**
	 * 삭제
	 */
	@Override
	public int delete(FinFavsVO finFavs) throws SQLException {
		String statement = this.nameSpace + ".do_delete";
		log.debug("param=" + finFavs.toString());
		return sqlSessionTemplate.delete(statement, finFavs);
	}

	/**
	 * 단건 등록
	 */
	@Override
	public int add(FinFavsVO finFavs) throws SQLException {
		String statement = this.nameSpace + ".do_add";
		log.debug("param=" + finFavs.toString());
		return sqlSessionTemplate.insert(statement, finFavs);
	}

	/**
	 * 다건 조회
	 */
	@Override
	public List<FinFavsVO> selectList(SearchVO searchVO) throws SQLException {
		String statement = this.nameSpace + ".do_selectList";
		log.debug("param=" + searchVO.toString());
		return sqlSessionTemplate.selectList(statement, searchVO);
	}
	
	public FinFavsDaoImple() {}

}
