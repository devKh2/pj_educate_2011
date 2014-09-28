package service.bbs.nbbs;

import model.NBBS_Article;
import model.NBBS_UpdateRequest;
import service.ArticleNotFoundException;
import service.InvalidPasswordException;


public interface NBBS_UpdateService {
	public NBBS_Article getArticle(int articleId) throws ArticleNotFoundException;
	
	public NBBS_Article update(NBBS_UpdateRequest ur)throws ArticleNotFoundException,InvalidPasswordException;

}
