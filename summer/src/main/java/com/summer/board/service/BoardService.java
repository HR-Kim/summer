package com.summer.board.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.summer.board.domain.Board;
import com.summer.comm.SearchVO;
import com.summer.user.domain.User;



/**
 * 비즈니스 처리
 * 트랜젝션 처리 : AOP 
 * 리플랙션 ?
 * @author sist
 *
 */
public interface BoardService {
	
	/**
	 * 글등록(게시판)
	 * @param board
	 * @throws SQLException
	 */
	public int add(Board board) throws SQLException;
	public List<Board> getSelectList(SearchVO vo) throws SQLException;
	public Board getSelectOne(Board board) throws SQLException;
	public int delete(Board board) throws SQLException;
	public int update(Board board) throws SQLException;
		
}
