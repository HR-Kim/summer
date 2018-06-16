package com.summer.board.dao;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.summer.board.domain.Board;
import com.summer.comm.SearchVO;
import com.summer.user.domain.User;

public interface BoardDao {
	
	public int add(Board board) throws SQLException;
	
	
}
