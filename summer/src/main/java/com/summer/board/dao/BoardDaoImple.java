package com.summer.board.dao;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.summer.board.domain.Board;
import com.summer.comm.SearchVO;
import com.summer.user.domain.User;

@Repository
public class BoardDaoImple implements BoardDao {
	static Logger log = Logger.getLogger(BoardDaoImple.class);

	
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private final String namespace = "com.summer.board.mappers";

	/**
	 * 초기화
	 */
	public void initmethod() {
		log.debug("=================================================");
		log.debug("initmethod");
		log.debug("=================================================");
	}

	/**
	 * 종료
	 */
	public void destroymethod() {
		log.debug("=================================================");
		log.debug("destroymethod");
		log.debug("=================================================");
	}

	public BoardDaoImple() {

	}

	/**
	 * 글등록(게시판)
	 * @return flag
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public int add(Board board) throws SQLException {
		String statement = this.namespace+".do_add";
		log.debug("Param:"+board.toString());
		return sqlSessionTemplate.insert(statement, board);
	}
	public List<Board> getSelectList(SearchVO vo) throws SQLException {
		String statement = this.namespace+".do_search";
		log.debug("Param:"+vo.toString());
		return sqlSessionTemplate.selectList(statement, vo);
	}
	@Override
	public Board getSelectOne(Board board) throws SQLException {
		String statement = this.namespace+".do_selectOne";
		log.debug("Param:"+board.toString());
		return sqlSessionTemplate.selectOne(statement, board);
	}
	@Override
	public int delete(Board board) throws SQLException {
		String statement = this.namespace+".do_delete";
		log.debug("Param:"+board.toString());
		return sqlSessionTemplate.delete(statement, board);
	}
	@Override
	public int update(Board board) throws SQLException {
		String statement = this.namespace+".do_update";
		log.debug("Param:"+board.toString());
		return sqlSessionTemplate.update(statement, board);
	}
}
