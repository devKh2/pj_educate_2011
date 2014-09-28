package service;

import java.sql.SQLException;
import java.util.List;

import dao.EmailAddrListDao;

import model.EmailListModel;

public class EmailAddrListServiceImpl implements EmailAddrListService {

	private EmailAddrListDao emailAddrListDao;
	
	
	public void setEmailAddrListDao(EmailAddrListDao emailAddrListDao) {
		this.emailAddrListDao = emailAddrListDao;
	}

	public List<EmailListModel> getCustomEmailAddr(){
		List<EmailListModel> list = null;
		
		try {
			list = emailAddrListDao.getCustomEmailAddr();
			return list;
		} catch (SQLException e) {
			throw new RuntimeException("DB 에러 발생:" + e.getMessage(), e);
		}
		
	}
	
	public List<EmailListModel> getStoreEmailAddr(){
		List<EmailListModel> list = null;
		
		try {
			list = emailAddrListDao.getStoreEmailAddr();
			return list;
		} catch (SQLException e) {
			throw new RuntimeException("DB 에러 발생:" + e.getMessage(), e);
		}
	}
}
