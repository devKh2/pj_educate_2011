package service.bbs.mbbs;

import model.MBBS_Article;
import service.ArticleNotFoundException;
public interface MBBS_ReadService {
	//DB���� �ϳ��� �Խñ��� �޾ƿ��� method �Դϴ�.
	public MBBS_Article read(int artId) throws ArticleNotFoundException;
}
