package service.bbs.nbbs;


import java.sql.SQLException;

import model.NBBS_Article;

import dao.NBBS_ArticleDao;

import service.IdGenerationFailedException;

public class NBBS_WriteServiceImpl implements NBBS_WriteService {
	private NBBS_ArticleDao nbbs_ArticleDao;

	public void setNbbs_ArticleDao(NBBS_ArticleDao nbbs_ArticleDao) {
		this.nbbs_ArticleDao = nbbs_ArticleDao;
	}

	public NBBS_Article write(NBBS_Article nbbs_Article)
			throws IdGenerationFailedException, SQLException {
		int articleId = nbbs_ArticleDao.insert(nbbs_Article);
		
		if (articleId == -1) {
			throw new RuntimeException("DB »ðÀÔ ¾ÈµÊ: " + articleId);
		}
	
		return nbbs_Article;
	}

	
}
