package com.summer.finrec.dao;

import com.summer.finrec.domain.FinSavingVO;
import com.summer.finrec.comm.FinSavingSearchVO;
import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class FinSavingDAO {
	static Logger log = Logger.getLogger(FinSavingDAO.class);
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private final String nameSpace = "com.summer.finrec.saving.mappers";
	
	public FinSavingDAO() {}
	
	public List<FinSavingVO> getSelectList(FinSavingSearchVO vo) throws SQLException {
		String statement = this.nameSpace + ".doSearch";
		log.debug("Param=" + vo.toString());
		return sqlSessionTemplate.selectList(statement, vo);
	}
	
	public FinSavingVO getSelectOne(FinSavingVO vo) throws SQLException {
		String statement = this.nameSpace + ".doSelectOne";
		log.debug("Param=" + vo.toString());
		return sqlSessionTemplate.selectOne(statement, vo);
	}

}