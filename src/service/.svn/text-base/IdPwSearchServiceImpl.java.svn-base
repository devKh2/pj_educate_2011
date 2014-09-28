package service;

import java.sql.SQLException;
import java.util.List;

import model.MemberListModel;
import model.SearchMember;

import org.apache.log4j.Logger;

import controller.IdSearchController;
import dao.MemberDao;

public class IdPwSearchServiceImpl implements IdPwSearchService{
	
	static Logger logger = Logger.getLogger(IdSearchController.class);
	private MemberDao memberDao;

	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	public MemberListModel IdSearch(String name){
		List<SearchMember> memberList = null;
		MemberListModel memberListView = null;
		
		logger.debug("IdPwSearchServiceImpl의 IdSearch메서드실행");
		
		
		try {
			logger.debug("MemberDaoImpl의  IdSearch메서드실행");
			memberList = memberDao.IdSearch(name);
			memberListView = new MemberListModel(memberList);
			
			return memberListView;
		} catch (SQLException e) {
			throw new RuntimeException("DB 에러 발생:" + e.getMessage(), e);
		}
	}
	public MemberListModel IdSearch(String name, String preResidentNum, String tailResidentNum){
		List<SearchMember> memberList = null;
		MemberListModel memberListView = null;
		
		logger.debug("IdPwSearchServiceImpl의 IdSearch메서드실행");
		
		
		try {
			logger.debug("MemberDaoImpl의  IdSearch메서드실행");
			memberList = memberDao.IdSearch(name, preResidentNum, tailResidentNum);
			memberListView = new MemberListModel(memberList);
			
			return memberListView;
		} catch (SQLException e) {
			throw new RuntimeException("DB 에러 발생:" + e.getMessage(), e);
		}

		
	}
	
	public MemberListModel PwSearch(String name, String preResidentNum, String tailResidentNum, String id){
		List<SearchMember> memberList = null;
		MemberListModel memberListView = null;
		
		logger.debug("IdPwSearchServiceImpl의 IdSearch메서드실행");
		
		
		try {
			logger.debug("MemberDaoImpl의  PwSearch메서드실행");
			memberList = memberDao.PwSearch(name, preResidentNum,tailResidentNum, id);
			memberListView = new MemberListModel(memberList);
			
			return memberListView;
		} catch (SQLException e) {
			throw new RuntimeException("DB 에러 발생:" + e.getMessage(), e);
		}

	}
}
