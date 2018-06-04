package com.summer.finfavs.dao;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.summer.comm.SearchVO;
import com.summer.finfavs.domain.FinFavs;

@Repository
public class FinFavsDaoImple implements FinFavsDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private final String nameSpace = "com.summer.finfavs.mappers";

	@Override
	public int delete(FinFavs finFavs) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int add(FinFavs finFavs) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<FinFavs> selectList(SearchVO searchVO) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	
	public FinFavsDaoImple() {}

}
