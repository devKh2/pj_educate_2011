package dao;

import java.sql.SQLException;

import org.apache.log4j.Logger;

import com.ibatis.sqlmap.client.SqlMapClient;

import controller.JoinAuthController;
import model.AuthNumModel;

public class JoinAuthDaoImpl implements JoinAuthDao {

	static Logger logger = Logger.getLogger(JoinAuthController.class);
	
	private SqlMapClient sqlMapClient;

	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}
	public int insert(AuthNumModel authNumModel) throws SQLException{
		logger.debug("jr : " + authNumModel.toString());
		
		int result = sqlMapClient.update("auth.insert", authNumModel);
		logger.debug("auth.join의 리턴값:  "+ result);
		return result;
	}
	
	public boolean isExist(AuthNumModel authNumModel) throws SQLException{
		boolean rtn = false;
		logger.debug("JoinAuthDaoImpl클래스의 isExist메서드 실행");
		
		String result = (String)sqlMapClient.queryForObject("auth.isExist",authNumModel);
		
		logger.debug("JoinAuthDaoImpl클래스의 isExist메서드의  result = " + result);
		if(result != null && result.equals(authNumModel.getEmail())){
			rtn = true;
			return rtn;
		}
		logger.debug(rtn);
		return rtn;
	}
	
	public boolean isEmailExist(String email)throws SQLException{
		boolean rtn = false;
		logger.debug("JoinAuthDaoImpl클래스의 isEmailExist메서드 실행");
		
		String result = (String)sqlMapClient.queryForObject("auth.isEmailExist",email);
		if(result != null && result.equals(email)){
			logger.debug("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
			rtn = true;
			return rtn;
		}
		logger.debug(rtn);
		return rtn;
	}
	public int emailDelete(String email) throws SQLException{
		int rtn = 0;
		logger.debug("JoinAuthDaoImpl클래스의  emailDelete메서드 실행");
		
		int result = sqlMapClient.delete("auth.emailDelete", email);
		logger.debug("auth.join의 리턴값:  "+ result);
		return rtn;
	}
}
