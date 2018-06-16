package com.summer.user.dao;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.summer.comm.SearchVO;
import com.summer.user.domain.User;

public interface UserDao {
	
	/**
	 * upsert(등록/수정)
	 * @param user
	 * @return
	 * @throws SQLException
	 */
	public int upsert(User user) throws SQLException;
	
	public int update(User user) throws SQLException;
	
	public List<User> getSelectList(SearchVO vo) throws SQLException;
	
	public int getAllCount() throws SQLException;
	
	public int deleteAll(User user) throws SQLException;
	
	public int add(User user) throws SQLException;
	
	public User get(User user) throws SQLException;
	
	public boolean loginCheck(User user) throws SQLException;
    public void logout(HttpSession session) throws SQLException;

	public int idCheck(User user) throws SQLException;
	public int nickCheck(User user) throws SQLException;
	public int phoneCheck(User user) throws SQLException;
	
	
}
