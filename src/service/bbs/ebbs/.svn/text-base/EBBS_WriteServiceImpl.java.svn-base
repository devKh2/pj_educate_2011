package service.bbs.ebbs;


import java.sql.SQLException;
import model.EBBS_Article;
import dao.EBBS_ArticleDao;
import service.IdGenerationFailedException;

public class EBBS_WriteServiceImpl implements EBBS_WriteService {
	private EBBS_ArticleDao ebbs_ArticleDao;

	public void setEbbs_ArticleDao(EBBS_ArticleDao ebbs_ArticleDao) {
		this.ebbs_ArticleDao = ebbs_ArticleDao;
	}

	public EBBS_Article write(EBBS_Article ebbs_Article)
			throws IdGenerationFailedException, SQLException {		
			System.out.println("public EBBS_Article write(EBBS_Article ebbs_Article) µé¾î¿È");
		int articleId = ebbs_ArticleDao.insert(ebbs_Article);
		
		if (articleId == -1) {
			throw new RuntimeException("DB »ðÀÔ ¾ÈµÊ: " + articleId);
		}
	
		return ebbs_Article;
	}
	
	public int id_search(String user_id,int stnum)throws SQLException{
		int user_article = 0;
		
		user_article = ebbs_ArticleDao.id_search(user_id,stnum);
		
		
		
		return user_article;
	}
}
