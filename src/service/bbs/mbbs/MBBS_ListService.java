package service.bbs.mbbs;

import java.sql.SQLException;
import java.util.ArrayList;

import model.MBBS_Article;
import model.MBBS_ArticleListModel;
import model.SearchParam;


public interface MBBS_ListService {
	public static final int COUNT_PER_PAGE = 10;

	//DB���� �Խñ��� list �� �޾ƿ��� method �Դϴ�. 
	public MBBS_ArticleListModel getArticleList(int requestPageNumber,String searchkind,String search);
	
	//���ο��� �˻������� ���� �˻����ǿ� �´� �Խñ� list ��������.
	public MBBS_ArticleListModel getSearchArticleList(SearchParam searParam);
	
	//���ο��� QnA�� �������� ��������.
	public ArrayList<MBBS_Article> random_3_List() throws SQLException ;
} 
