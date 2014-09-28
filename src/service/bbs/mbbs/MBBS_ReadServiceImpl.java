package service.bbs.mbbs;


import java.sql.SQLException;
import org.apache.log4j.Logger;

import service.ArticleNotFoundException;

import dao.MBBS_ArticleDao;
import model.MBBS_Article;

public class MBBS_ReadServiceImpl implements MBBS_ReadService {
static Logger logger = Logger.getLogger(MBBS_ReadServiceImpl.class);
	
	private MBBS_ArticleDao mbbs_ArticleDao;	

	public void setMbbs_ArticleDao(MBBS_ArticleDao mbbs_ArticleDao) {
		this.mbbs_ArticleDao = mbbs_ArticleDao;
	}
	
	public MBBS_Article read(int artId) throws ArticleNotFoundException {
		try {
			MBBS_Article article = mbbs_ArticleDao.selectById(artId);
			if (article == null) {
				throw new ArticleNotFoundException(
						"게시글이 존재하지 않습니다 : " + artId);
			}
			mbbs_ArticleDao.increaseReadCount(artId);

				article.setMbbs_count(article.getMbbs_count() + 1);
			return article;
		} catch (SQLException e) {
			throw new RuntimeException("DB 에러 발생: " + e.getMessage(), e);
		}

	}

}
