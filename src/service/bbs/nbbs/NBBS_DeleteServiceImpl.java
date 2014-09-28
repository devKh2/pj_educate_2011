package service.bbs.nbbs;


import java.sql.SQLException;

import model.NBBS_Article;
import model.NBBS_UpdateRequest;

import dao.NBBS_ArticleDao;

import service.ArticleNotFoundException;
import service.InvalidPasswordException;


public class NBBS_DeleteServiceImpl implements NBBS_DeleteService{
	private NBBS_ArticleDao nbbs_ArticleDao;
	
	public void setNbbs_ArticleDao(NBBS_ArticleDao nbbs_ArticleDao) {
		this.nbbs_ArticleDao = nbbs_ArticleDao;
	}

	public void delete(NBBS_UpdateRequest dr) 
	throws ArticleNotFoundException,InvalidPasswordException {

		try {
					nbbs_ArticleDao.delete(dr.getNotice_artid());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		
		} finally {
			
		}
		
	}

}
