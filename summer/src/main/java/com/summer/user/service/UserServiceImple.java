package com.summer.user.service;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.summer.comm.SearchVO;
import com.summer.comm.StringUtil;
import com.summer.user.dao.UserDao;
import com.summer.user.domain.Level;
import com.summer.user.domain.User;



/**
 * 비즈니스 처리
 * 트랜젝션 처리 : AOP 
 * 리플랙션 ?
 * @author sist
 *
 */

@Service
public class UserServiceImple implements UserService {

	private Logger log = Logger.getLogger(this.getClass());
	
	public static final int MIN_LOGCOUNT_FOR_SILVER = 50;
	public static final int MIN_RECOMEND_FOR_GOLD = 30;
	
	@Autowired
	private PlatformTransactionManager transactionManager;
	
	
	@Autowired
	private UserDao userDao;
	
	
	
	/**
	 * 수정
	 * @param user
	 * @return int
	 * @throws SQLException
	 */
	public int update(User user) throws SQLException{
		
		return userDao.update(user);
	}
	
	/**
	 * 목록 조회
	 * @param vo
	 * @return List
	 * @throws SQLException
	 */
	public List<User> getSelectList(SearchVO vo) throws SQLException{
		
		return userDao.getSelectList(vo);
	}

	/**
	 * 단건 삭제
	 * @param user
	 * @return int
	 * @throws SQLException
	 */
	public int deleteAll(User user) throws SQLException{
		
		return userDao.deleteAll(user);
	}
	
	/**
	 * 단건 조회
	 * @param user
	 * @return User
	 * @throws SQLException
	 */
	public User get(User user) throws SQLException{
		
		return userDao.get(user);
	}
	
	/**
	 * 신규 사용자에 대한 Level.BASIC으로 기본값 설정
	 * @param user
	 * @throws SQLException
	 */
	
	
	/**
	 * 업그레이드 유무 Return
	 * @param user
	 * @return boolean
	 */
	
	
	
	
	

	@Override
	public int upsert(User user) throws SQLException {
		return userDao.upsert(user);
	}

	@Override
	public int add(User user) throws SQLException {
		return userDao.add(user);
	}

	@Override
	public void upgradeLevels(SearchVO searchVO) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean loginCheck(User user, HttpSession session) throws SQLException {
		 boolean result = userDao.loginCheck(user);
	        if (result == true) { // true일 경우 세션에 등록
	            User vo = get(user);
	            // 세션 변수 등록
	            session.setAttribute("id", vo.getId());
	            log.debug("userservieimplt id="+session.getAttribute("id"));
	            session.setAttribute("name", vo.getName());
	        } 
	        return result;
	}

    // 01_02. 회원 로그인 정보
    @Override
    public User viewMember(User user) throws SQLException {
        return userDao.viewMember(user);
    }
    

	@Override
	public int idCheck(User user) throws SQLException {
		return userDao.idCheck(user);
	}

	@Override
	public int nickCheck(User user) throws SQLException {
		return userDao.nickCheck(user);
	}

	@Override
	public int phoneCheck(User user) throws SQLException {
		return userDao.phoneCheck(user);
	}
	
}
