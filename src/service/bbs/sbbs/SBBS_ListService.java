package service.bbs.sbbs;

import model.SBBS_ArticleListModel;


public interface SBBS_ListService {
	public static final int COUNT_PER_PAGE = 10;

	public SBBS_ArticleListModel getArticleList(int requestPageNumber,String searchkind,String search,String stnum);
	
}
