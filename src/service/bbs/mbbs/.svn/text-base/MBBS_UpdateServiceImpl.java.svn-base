package service.bbs.mbbs;

import java.sql.SQLException;

import service.ArticleNotFoundException;
import service.InvalidPasswordException;

import dao.MBBS_ArticleDao;
import model.MBBS_Article;
import model.MBBS_UpdateRequest;

public class MBBS_UpdateServiceImpl implements MBBS_UpdateService {

	private MBBS_ArticleDao mbbs_ArticleDao;

	public void setMbbs_ArticleDao(MBBS_ArticleDao mbbs_ArticleDao) {
		this.mbbs_ArticleDao = mbbs_ArticleDao;
	}

	public MBBS_Article getArticle(int artId) throws ArticleNotFoundException {

		try {

			MBBS_Article article = mbbs_ArticleDao.selectById(artId);
			if (article == null) {
				throw new ArticleNotFoundException("게시글이 존재하지 않습니다: " + artId);
			}
			return article;
		} catch (SQLException e) {
			throw new RuntimeException("DB 에러 발생: " + e.getMessage());
		} finally {
		}
	}

	public MBBS_Article update(MBBS_UpdateRequest ur)
			throws ArticleNotFoundException, InvalidPasswordException {
		System.out.println("ur.getCu_id() = " + ur.getCu_id());
		System.out.println("ur.getMember_id() = " + ur.getMember_id());
		try {
			if (!(ur.getCu_id()).equals(ur.getMember_id())) {
				return null;
			}

			MBBS_Article updatedArticle = new MBBS_Article();

			updatedArticle.setMbbs_artid(ur.getMbbs_artid());
			updatedArticle.setMbbs_title(ur.getMbbs_title());
			updatedArticle.setMbbs_content(ur.getMbbs_content());

			int updateCount = mbbs_ArticleDao.update(updatedArticle);
			if (updateCount == 0) {
				throw new ArticleNotFoundException("게시글이 존재하지 않습니다 : "
						+ ur.getMbbs_artid());
			}
			MBBS_Article article = mbbs_ArticleDao.selectById(ur
					.getMbbs_artid());

			return article;
		} catch (SQLException e) {

			throw new RuntimeException("DB 에러 발생:" + e.getMessage(), e);
		} catch (ArticleNotFoundException e) {

			throw e;
		} finally {
		}

	}
}
