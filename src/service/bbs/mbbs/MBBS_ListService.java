package service.bbs.mbbs;

import java.sql.SQLException;
import java.util.ArrayList;

import model.MBBS_Article;
import model.MBBS_ArticleListModel;
import model.SearchParam;


public interface MBBS_ListService {
	public static final int COUNT_PER_PAGE = 10;

	//DB에서 게시글을 list 로 받아오는 method 입니다. 
	public MBBS_ArticleListModel getArticleList(int requestPageNumber,String searchkind,String search);
	
	//메인에서 검색엔진을 통해 검색조건에 맞는 게시글 list 가져오기.
	public MBBS_ArticleListModel getSearchArticleList(SearchParam searParam);
	
	//메인에서 QnA글 랜덤으로 가져오기.
	public ArrayList<MBBS_Article> random_3_List() throws SQLException ;
} 
