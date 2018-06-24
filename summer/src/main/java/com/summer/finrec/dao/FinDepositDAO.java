package com.summer.finrec.dao;

import com.summer.finrec.comm.FinDepositSearchVO;
import com.summer.finrec.domain.FinDepositVO;

import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class FinDepositDAO {
	static Logger log = Logger.getLogger(FinDepositDAO.class);
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private final String nameSpace = "com.summer.finrec.deposit.mappers";
	
	public FinDepositDAO() {}
	
	public List<FinDepositVO> getSelectList(FinDepositSearchVO vo) throws SQLException {
		String statement = this.nameSpace + ".doSearch";
		log.debug("Param=" + vo.toString());
		return sqlSessionTemplate.selectList(statement, vo);
	}
	
	public FinDepositVO getSelectOne(FinDepositVO vo) throws SQLException {
		String statement = this.nameSpace + ".doSelectOne";
		log.debug("Param=" + vo.toString());
		return sqlSessionTemplate.selectOne(statement, vo);
	}

}