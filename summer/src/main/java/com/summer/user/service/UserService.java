package com.summer.user.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.summer.comm.SearchVO;
import com.summer.user.domain.User;



/**
 * 비즈니스 처리
 * 트랜젝션 처리 : AOP 
 * 리플랙션 ?
 * @author sist
 *
 */
public interface UserService {
	
	/**
	 * 아이디 중복검사
	 * @param user
	 * @return
	 * @throws SQLException
	 */
	public int idCheck(User user) throws SQLException;
	public int nickCheck(User user) throws SQLException;
	public int phoneCheck(User user) throws SQLException;
	
	/**
	 * upsert(등록/수정)
	 * @param user
	 * @return
	 * @throws SQLException
	 */
	public int upsert(User user) throws SQLException;
	
	/**
	 * 목록 조회
	 * @param vo
	 * @return List
	 * @throws SQLException
	 */
	public List<User> getSelectList(SearchVO vo) throws SQLException;
	
	/**
	 * 단건 삭제
	 * @param user
	 * @return int
	 * @throws SQLException
	 */
	public int deleteAll(User user) throws SQLException;
	
	/**
	 * 수정
	 * @param user
	 * @return int
	 * @throws SQLException
	 */
	public int update(User user) throws SQLException;
	
	/**
	 * 단건 조회
	 * @param user
	 * @return User
	 * @throws SQLException
	 */
	public User get(User user) throws SQLException;

	/**
	 * 신규 사용자에 대한 Level.BASIC으로 기본값 설정
	 * @param user
	 * @throws SQLException
	 */
	public int add(User user) throws SQLException;
	
	//등업처리
	//Level.BASIC,  로그인>=50 ==> Level.SILVER
	//Level.SILVER, 추천  >=30 ==> Level.GOLD문
	public void upgradeLevels(SearchVO searchVO) throws SQLException ;
	
	/**
	 * 로긴쳌
	 * @param vo
	 * @param session
	 * @return
	 */
	public boolean loginCheck(User user, HttpSession session) throws SQLException;
	

    public void logout(HttpSession sesseion) throws SQLException;
    public User findId(User user) throws SQLException;
    public User findPw(User user) throws SQLException;
    public int updatePwd(User user) throws SQLException;
	
}
