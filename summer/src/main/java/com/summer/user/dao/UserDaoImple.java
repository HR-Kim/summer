package com.summer.user.dao;

import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.summer.comm.SearchVO;
import com.summer.user.domain.User;

@Repository
public class UserDaoImple implements UserDao {
	static Logger log = Logger.getLogger(UserDaoImple.class);

	
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private final String namespace = "com.summer.user.mappers";

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

	public UserDaoImple() {

	}

	public int update(User user) throws SQLException {
		String statement = this.namespace+".do_update";
		log.debug("Param:"+user.toString());
		return sqlSessionTemplate.update(statement, user);
	}
	
	
	public List<User> getSelectList(SearchVO vo) throws SQLException {
		String statement = this.namespace+".do_search";
		log.debug("Param:"+vo.toString());
		return sqlSessionTemplate.selectList(statement, vo);
	}
	

	public int getAllCount() throws SQLException {
		int result = -1;

		return result;

	}
	/**
	 * 
	 */
	public int deleteAll(User user) throws SQLException {
		String statement = this.namespace+".do_delete";
		log.debug("Param:"+user.toString());
		return sqlSessionTemplate.delete(statement, user);
	}

	/**
	 * 등록
	 * 
	 * @return flag
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public int add(User user) throws SQLException {
		String statement = this.namespace+".do_add";
		log.debug("Param:"+user.toString());
		return sqlSessionTemplate.insert(statement, user);
	}

	/**
	 * 단건 조회
	 * 
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public User get(User user) throws SQLException {
		String statement = this.namespace+".do_selectOne";
		log.debug("Param:"+user.toString());
		return sqlSessionTemplate.selectOne(statement, user);
		
	}

	@Override
	public int upsert(User user) throws SQLException {
		String statmenet = this.namespace+".do_upsert";
		log.debug("Param:"+user.toString());
		return sqlSessionTemplate.delete(statmenet, user);
	}

	/**
	 * 로긴 첵
	 */
	@Override
	public boolean loginCheck(User user) {
		String statement = this.namespace+".do_loginCheck";
		String name = sqlSessionTemplate.selectOne(statement, user);
        return (name == null) ? false : true;
	}

    // 01_02. 회원 로그인 정보
    @Override
    public User viewMember(User user) {
    	String statement = this.namespace+".do_viewMember";
    	return sqlSessionTemplate.selectOne(statement, user);
    }

	@Override
	public int idCheck(User user) throws SQLException {
		String statement = this.namespace+".do_idCheck";
		return sqlSessionTemplate.selectOne(statement, user);
	}


}
