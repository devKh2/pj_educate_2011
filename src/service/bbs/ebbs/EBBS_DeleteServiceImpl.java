package service.bbs.ebbs;


import java.sql.SQLException;

import model.EBBS_Article;
import model.EBBS_UpdateRequest;

import dao.EBBS_ArticleDao;

import service.ArticleNotFoundException;
import service.InvalidPasswordException;



public class EBBS_DeleteServiceImpl implements EBBS_DeleteService{
	private EBBS_ArticleDao ebbs_ArticleDao;
	
	public void setEbbs_ArticleDao(EBBS_ArticleDao ebbs_ArticleDao) {
		this.ebbs_ArticleDao = ebbs_ArticleDao;
	}

	public void delete(int articleId) 
	throws ArticleNotFoundException,InvalidPasswordException {

		try {
			ebbs_ArticleDao.delete(articleId);
/*
			EBBS_Article ebbs_article=(EBBS_Article)ebbs_ArticleDao.selectById(dr.getEbbs_artid());
			dr.setCu_id(ebbs_article.getCu_id());
				if((dr.getCu_id()).equals(dr.getMember_id())){
					ebbs_ArticleDao.delete(dr.getEbbs_artid());
				}
*/
		} catch (SQLException e) {
			throw new RuntimeException(e);
		
		} finally {
			
		}
		
	}

}
