package service.bbs.sbbs;


import java.sql.SQLException;

import model.SBBS_Article;

import org.apache.log4j.Logger;

import service.ArticleNotFoundException;


import dao.SBBS_ArticleDao;


public class SBBS_ReadServiceImpl implements SBBS_ReadService {
static Logger logger = Logger.getLogger(SBBS_ReadServiceImpl.class);
	
	private SBBS_ArticleDao sbbs_ArticleDao;	

	public void setSbbs_ArticleDao(SBBS_ArticleDao sbbs_ArticleDao) {
		this.sbbs_ArticleDao = sbbs_ArticleDao;
	}
	
	public SBBS_Article read(int artId) throws ArticleNotFoundException {
		try {
			SBBS_Article article = sbbs_ArticleDao.selectById(artId);
			if (article == null) {
				throw new ArticleNotFoundException(
						"게시글이 존재하지 않습니다 : " + artId);
			}
			sbbs_ArticleDao.increaseReadCount(artId);

				article.setSbbs_count(article.getSbbs_count() + 1);
			return article;
		} catch (SQLException e) {
			throw new RuntimeException("DB 에러 발생: " + e.getMessage(), e);
		}

	}

}
