package service.bbs.mbbs;

import service.ArticleNotFoundException;
import service.InvalidPasswordException;
import model.MBBS_Article;
import model.MBBS_UpdateRequest;

public interface MBBS_UpdateService {
	//DB에서 하나의 게시글을 받아오는 method 입니다.
	public MBBS_Article getArticle(int articleId) throws ArticleNotFoundException;
	// 게시글을 수정하기 위해서 사용하는 method 입니다.
	public MBBS_Article update(MBBS_UpdateRequest ur)throws ArticleNotFoundException,InvalidPasswordException;

}
