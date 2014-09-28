package service.bbs.sbbs;

import model.SBBS_Article;
import model.SBBS_UpdateRequest;
import service.ArticleNotFoundException;
import service.InvalidPasswordException;


public interface SBBS_UpdateService {
	public SBBS_Article getArticle(int articleId) throws ArticleNotFoundException;
	
	public SBBS_Article update(SBBS_UpdateRequest ur)throws ArticleNotFoundException,InvalidPasswordException;

}
