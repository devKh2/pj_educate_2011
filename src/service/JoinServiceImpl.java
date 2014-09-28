package service;


import java.sql.SQLException;

import org.apache.log4j.Logger;

import controller.JoinAuthController;
import dao.MemberDao;
import model.JoinRequest;
import model.Member;

public class JoinServiceImpl implements JoinService {

	private MemberDao memberDao;

	static Logger logger = Logger.getLogger(JoinAuthController.class);
	
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	//즐겨찾기 추가
	public int insertFavoriteSite(String st_num, String id) throws SQLException {
		return memberDao.insertFavoriteSite(st_num, id);
	}

	public int join(JoinRequest jr){
		int rtn = 0;
		logger.debug("JoinServiceImpl의 join메서드 실행");
		try{
			rtn = memberDao.insert(jr);
			
			return rtn;
		}catch (SQLException e){
			throw new RuntimeException("DB 에러 발생:"+e.getMessage(), e);
		}
	}
	
	public int modified(JoinRequest jr){
		int rtn = 0;
		logger.debug("JoinServiceImpl의 modified메서드 실행");
		try{
			rtn = memberDao.modified(jr);
			
			return rtn;
		}catch (SQLException e){
			throw new RuntimeException("DB 에러 발생:"+e.getMessage(), e);
		}
	}
	
	public boolean isExist(String id){
		boolean rtn = false;
		
		try{
			rtn = memberDao.isExist(id);
			return rtn;
		}catch (SQLException e){
			throw new RuntimeException("DB 에러발생:"+e.getMessage(), e);
		}
	}
	
	public Member login(String id, String pw){
		Member member = null;
		
		try{
			member = memberDao.login(id, pw);
			return member;
		}catch (SQLException e){
			throw new RuntimeException("DB 에러 발생:"+e.getMessage(), e);
		}
	}
	
	public Member adminMember_login(String id, String pw){
		Member admin_member = null;
		
		try{
			admin_member = memberDao.admin_login(id, pw);
			return admin_member;
		}catch (SQLException e){
			throw new RuntimeException("DB 에러 발생:"+e.getMessage(), e);
		}
	}
	
	public Member storeMember_login(String id, String pw){
		Member store_member = null;
		
		try{
			store_member = memberDao.store_login(id, pw);
			return store_member;
		}catch (SQLException e){
			throw new RuntimeException("DB 에러 발생:"+e.getMessage(), e);
		}
	}

}
