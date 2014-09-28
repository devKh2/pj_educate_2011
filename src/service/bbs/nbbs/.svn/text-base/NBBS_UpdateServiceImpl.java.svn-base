package service.bbs.nbbs;


import java.sql.SQLException;

import model.NBBS_Article;
import model.NBBS_UpdateRequest;

import dao.NBBS_ArticleDao;

import service.ArticleNotFoundException;
import service.InvalidPasswordException;



public class NBBS_UpdateServiceImpl implements NBBS_UpdateService {
	
	private NBBS_ArticleDao nbbs_ArticleDao;

	public void setNbbs_ArticleDao(NBBS_ArticleDao nbbs_ArticleDao) {
		this.nbbs_ArticleDao = nbbs_ArticleDao;
	}

	public NBBS_Article getArticle(int artId) throws ArticleNotFoundException {
		
		try {
			
			NBBS_Article article = nbbs_ArticleDao.selectById(artId);
			if (article == null) {
				throw new ArticleNotFoundException("게시글이 존재하지 않습니다: "
						+ artId);
			}
			return article;
		} catch (SQLException e) {
			throw new RuntimeException("DB 에러 발생: " + e.getMessage());
		} finally {
		}
	}

	public NBBS_Article update(NBBS_UpdateRequest ur) 
			throws ArticleNotFoundException,
				InvalidPasswordException {
		
		try {
			if(!(ur.getAdmin_id()).equals(ur.getMember_id())){
				return null;
			}
		
			NBBS_Article updatedArticle = new NBBS_Article();
			
			updatedArticle.setNotice_artid(ur.getNotice_artid());
			updatedArticle.setNotice_title(ur.getNotice_title());
			updatedArticle.setNotice_content(ur.getNotice_content());
			
			int updateCount = nbbs_ArticleDao.update(updatedArticle);
			if (updateCount == 0) {
				throw new ArticleNotFoundException(
				"게시글이 존재하지 않습니다 : " + ur.getNotice_artid());
			}
			NBBS_Article article = nbbs_ArticleDao.selectById(ur
					.getNotice_artid());

			return article;
		} catch (SQLException e) {
			
			throw new RuntimeException("DB 에러 발생:" + e.getMessage(), e);
		} catch (ArticleNotFoundException e) {
			throw e;
		} finally {}
		
	}
}
