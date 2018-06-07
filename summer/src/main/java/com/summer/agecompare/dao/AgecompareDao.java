package com.summer.agecompare.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.datasource.SimpleDriverDataSource;
import org.springframework.stereotype.Repository;
import org.springframework.test.jdbc.JdbcTestUtils;

import com.summer.agecompare.domain.Agecompare;

@Repository
public class AgecompareDao {
	static Logger log = Logger.getLogger(AgecompareDao.class);
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
	
	public Agecompare get(Agecompare agecompare) throws SQLException {
		String statement = this.namespace+".doSelectOne";
		log.debug("Param:"+agecompare.toString());
		return sqlSessionTemplate.selectOne(statement, agecompare);
	}
	
	private RowMapper<Agecompare> agecompareMapper =new  RowMapper<Agecompare>() {
		public Agecompare mapRow(ResultSet rs, int rowNum) throws SQLException {
			Agecompare outVo=new Agecompare();
			
			outVo.setUserId(rs.getString("userId"));
			outVo.setName(rs.getString("name"));
			outVo.setNickname(rs.getString("nickname"));
			outVo.setGender(rs.getString("gender"));
			outVo.setBirth(rs.getString("birth"));
			outVo.setEmail(rs.getString("email"));
			outVo.setPhone(rs.getString("phone"));
			
			return outVo;
		}
	};
}
