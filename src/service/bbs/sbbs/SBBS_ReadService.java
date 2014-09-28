package service.bbs.sbbs;

import model.SBBS_Article;
import service.ArticleNotFoundException;
public interface SBBS_ReadService {
	public SBBS_Article read(int artId) throws ArticleNotFoundException;
}
