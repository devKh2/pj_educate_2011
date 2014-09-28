package service.bbs.mbbs;


import java.sql.SQLException;

import service.ArticleNotFoundException;
import service.InvalidPasswordException;

import model.MBBS_Article;
import model.MBBS_UpdateRequest;

import dao.MBBS_ArticleDao;


public class MBBS_DeleteServiceImpl implements MBBS_DeleteService{
	private MBBS_ArticleDao mbbs_ArticleDao;
	
	public void setMbbs_ArticleDao(MBBS_ArticleDao mbbs_ArticleDao) {
		this.mbbs_ArticleDao = mbbs_ArticleDao;
	}

	public void delete(MBBS_UpdateRequest dr) 
	throws ArticleNotFoundException,InvalidPasswordException {

		try {
			MBBS_Article mbbs_article=(MBBS_Article)mbbs_ArticleDao.selectById(dr.getMbbs_artid());
			dr.setCu_id(mbbs_article.getCu_id());
				if((dr.getCu_id()).equals(dr.getMember_id())){
					mbbs_ArticleDao.delete(dr.getMbbs_artid());
				}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		
		} finally {
			
		}
		
	}
	public void administrator_delete(MBBS_UpdateRequest dr) 
	throws ArticleNotFoundException,InvalidPasswordException {

		try {
				
			mbbs_ArticleDao.delete(dr.getMbbs_artid());
				
		} catch (SQLException e) {
			throw new RuntimeException(e);
		
		} finally {
			
		}
		
	}

}
