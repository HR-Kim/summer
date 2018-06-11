package com.summer.codes.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.summer.codes.domain.CodeVO;

@Repository
public class CodeDao {
static Logger log = Logger.getLogger(CodeDao.class);
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private final String namespace = "com.summer.codes.mappers";
	
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
	
	public CodeDao() {
		
	}
	
	/**
	 * 리스트 조회
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public List<CodeVO> getSelectList(CodeVO vo) throws SQLException{
		
		String statement = this.namespace+".do_selectList";
		
		log.debug("param:"+vo.toString());
		
		log.debug("statement"+statement);
		return sqlSessionTemplate.selectList(statement, vo);
	}
	
	
}
