package service.bbs.ebbs;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.EBBS_ArticleListModel;
import model.Random4_EBBS;



public interface EBBS_ListService {
	public static final int COUNT_PER_PAGE = 10;

	public EBBS_ArticleListModel getArticleList(int requestPageNumber,String searchkind,String search,String stnum);
	
	public ArrayList<Random4_EBBS> get_4list() throws SQLException;
}
