package service.bbs.nbbs;


import java.sql.SQLException;

import model.NBBS_Article;

import org.apache.log4j.Logger;

import dao.NBBS_ArticleDao;

import service.ArticleNotFoundException;


public class NBBS_ReadServiceImpl implements NBBS_ReadService {
static Logger logger = Logger.getLogger(NBBS_ReadServiceImpl.class);
	
	private NBBS_ArticleDao nbbs_ArticleDao;	

	public void setNbbs_ArticleDao(NBBS_ArticleDao nbbs_ArticleDao) {
		this.nbbs_ArticleDao = nbbs_ArticleDao;
	}
	
	public NBBS_Article read(int artId) throws ArticleNotFoundException {
		try {
			NBBS_Article article = nbbs_ArticleDao.selectById(artId);
			if (article == null) {
				throw new ArticleNotFoundException(
						"게시글이 존재하지 않습니다 : " + artId);
			}
			nbbs_ArticleDao.increaseReadCount(artId);

				article.setNotice_count(article.getNotice_count() + 1);
			return article;
		} catch (SQLException e) {
			throw new RuntimeException("DB 에러 발생: " + e.getMessage(), e);
		}

	}

}
