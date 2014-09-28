package service.bbs.sbbs;


import java.sql.SQLException;
import model.SBBS_Article;
import model.SBBS_UpdateRequest;
import service.ArticleNotFoundException;
import service.InvalidPasswordException;
import dao.SBBS_ArticleDao;

public class SBBS_UpdateServiceImpl implements SBBS_UpdateService {
	
	private SBBS_ArticleDao sbbs_ArticleDao;

	public void setSbbs_ArticleDao(SBBS_ArticleDao sbbs_ArticleDao) {
		this.sbbs_ArticleDao = sbbs_ArticleDao;
	}

	public SBBS_Article getArticle(int artId) throws ArticleNotFoundException {
		
		try {
			
			SBBS_Article article = sbbs_ArticleDao.selectById(artId);
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

	public SBBS_Article update(SBBS_UpdateRequest ur) 
			throws ArticleNotFoundException,
				InvalidPasswordException {
		
		try {
			if(!(ur.getCu_id()).equals(ur.getMember_id())){
				return null;
			}
		
			SBBS_Article updatedArticle = new SBBS_Article();
			
			updatedArticle.setSbbs_artid(ur.getSbbs_artid());
			updatedArticle.setSbbs_title(ur.getSbbs_title());
			updatedArticle.setSbbs_content(ur.getSbbs_content());
			
			int updateCount = sbbs_ArticleDao.update(updatedArticle);
			if (updateCount == 0) {
				throw new ArticleNotFoundException(
				"게시글이 존재하지 않습니다 : " + ur.getSbbs_artid());
			}
			SBBS_Article article = sbbs_ArticleDao.selectById(ur
					.getSbbs_artid());

			return article;
		} catch (SQLException e) {
			
			throw new RuntimeException("DB 에러 발생:" + e.getMessage(), e);
		} catch (ArticleNotFoundException e) {
			
			throw e;
		} finally {}
		
	}
}
