package com.summer.board.service;

import java.sql.SQLException;
import java.util.List;

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

import com.summer.board.dao.BoardDao;
import com.summer.board.domain.Board;
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
public class BoardServiceImple implements BoardService {

	private Logger log = Logger.getLogger(this.getClass());
	
	public static final int MIN_LOGCOUNT_FOR_SILVER = 50;
	public static final int MIN_RECOMEND_FOR_GOLD = 30;
	
	@Autowired
	private PlatformTransactionManager transactionManager;
	
	
	@Autowired
	private BoardDao boardDao;
	
	
	
	@Override
	public int add(Board board) throws SQLException {
		return boardDao.add(board);
	}



	@Override
	public List<Board> getSelectList(SearchVO vo) throws SQLException{
		
		return boardDao.getSelectList(vo);
	}



	@Override
	public Board getSelectOne(Board board) throws SQLException {
		return boardDao.getSelectOne(board);
	}
	
}
