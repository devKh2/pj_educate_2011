package service;

import java.sql.SQLException;

import org.apache.log4j.Logger;

import controller.JoinAuthController;
import dao.JoinAuthDao;
import model.AuthNumModel;

public class JoinAuthServiceImpl implements JoinAuthService  {

	private JoinAuthDao joinAuthDao; 
	static Logger logger = Logger.getLogger(JoinAuthController.class);
	
	public void setJoinAuthDao(JoinAuthDao joinAuthDao) {
		this.joinAuthDao = joinAuthDao;
	}

	public int joinAuth(AuthNumModel authNumModel){
		int rtn = 0;
		logger.debug("JoinAuthServiceImpl의 joinAuth메서드 실행" );
		
		try {
			rtn = joinAuthDao.insert(authNumModel);
			return rtn;
		} catch (SQLException e) {
			throw new RuntimeException("DB 에러 발생:"+e.getMessage(), e);
		}
	}
	
	public boolean isExist(AuthNumModel authNumModel){
		boolean rtn = false;
		logger.debug("JoinAuthServiceImpl의  isExist메서드 실행" );
		try {
			rtn = joinAuthDao.isExist(authNumModel);
			return rtn;
		} catch (SQLException e) {
			throw new RuntimeException("DB 에러발생:"+e.getMessage(), e);
		}
		
	}
	
	public boolean isEmailExist(String email){
		boolean rtn = false;
		logger.debug("JoinAuthServiceImpl의  isEmailExist메서드 실행");
		try {
			rtn = joinAuthDao.isEmailExist(email);
			return rtn;
		} catch (SQLException e) {
			throw new RuntimeException("DB 에러발생:"+e.getMessage(), e);
		}
	}
	
	public int emailDelete(String email){
		int rtn = 0;
		logger.debug("JoinAuthServiceImpl의  emailDelete메서드 실행" );
		try {
			rtn = joinAuthDao.emailDelete(email);
			return rtn;
		} catch (SQLException e) {
			throw new RuntimeException("DB 에러발생:"+e.getMessage(), e);
		}
	}
}
