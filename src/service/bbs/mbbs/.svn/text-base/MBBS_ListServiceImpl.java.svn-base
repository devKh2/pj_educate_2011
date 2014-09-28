package service.bbs.mbbs;


import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.MBBS_Article;
import model.MBBS_ArticleListModel;
import model.SearchParam;

import org.apache.log4j.Logger;

import dao.MBBS_ArticleDao;


public class MBBS_ListServiceImpl implements MBBS_ListService {
	static Logger logger = Logger.getLogger(MBBS_ListServiceImpl.class);
	
	private MBBS_ArticleDao mbbs_ArticleDao;
	
	public void setMbbs_ArticleDao(MBBS_ArticleDao mbbs_ArticleDao) {
		this.mbbs_ArticleDao = mbbs_ArticleDao;
	}
 
	public MBBS_ArticleListModel getArticleList(int requestPageNumber,String searchkind,String search) {
		if (requestPageNumber < 0) {
			throw new IllegalArgumentException("page number < 0 : "
					+ requestPageNumber);
		}
		
		try {
			int totalArticleCount = mbbs_ArticleDao.selectCount(searchkind,search);
			
			//totalArticleCount가 0이면 새로 생성된 ArticleListModel 을 리턴함. 
			if (totalArticleCount == 0) {
				return new MBBS_ArticleListModel();
			}

			int totalPageCount = calculateTotalPageCount(totalArticleCount);

			int firstRow = (requestPageNumber - 1) * COUNT_PER_PAGE + 1;
			int endRow = firstRow + COUNT_PER_PAGE - 1;

			if (endRow > totalArticleCount) {
				endRow = totalArticleCount;
			}
			
			List<MBBS_Article> articleList 
					= mbbs_ArticleDao.select(firstRow,endRow,searchkind, search);
			
			MBBS_ArticleListModel articleListView = new MBBS_ArticleListModel(
					articleList, requestPageNumber, totalPageCount, firstRow,
					endRow, totalArticleCount, 10);
			//총 게시물 수 셋팅
			
			return articleListView;
		} catch (SQLException e) {
			throw new RuntimeException("DB 에러 발생:"+e.getMessage(), e);
		} finally {
			
		}		
	}
	
	private int calculateTotalPageCount(int totalArticleCount) {
		if (totalArticleCount == 0) {
			return 0;
		}
		int pageCount = totalArticleCount / COUNT_PER_PAGE;
		if (totalArticleCount % COUNT_PER_PAGE > 0) {
			pageCount++;
		}
		return pageCount;
	}

	@Override
	public MBBS_ArticleListModel getSearchArticleList(SearchParam searParam) {
		//검색된 row 수로 전체 결과 페이지 수 결정.
		int totalPageCount;
		int firstRow;
		int endRow;
		int totalArticleModelCount;
		
		if (searParam.getP() < 0) {
			throw new IllegalArgumentException("page number < 0 : "
					+ searParam.getP());
		}
		 
		try {
				List<MBBS_Article> mbbs_articleModelList;
				//검색창에서 통합검색으로 검색했을 때 가게  row count.
				totalArticleModelCount = mbbs_ArticleDao.selectCount_search(searParam.getKw());
				if (totalArticleModelCount == 0) {
					return new MBBS_ArticleListModel();
				}
				
				if(searParam.getDetail() != null){
					// 검색 상세 결과 페이지 --
					//검색된 row 수로 전체 결과 페이지 수 결정.(각 페이지당 10개 row) 
					totalPageCount = calculateTotalPageCount_search(totalArticleModelCount, searParam.getPage_per_count());
					
					//통합검색 후 게시글 더보기 클릭 했을 때, 한페이지당 시작과 끝 로우 결정. ( 10개 )
					firstRow = calculateFirstRow(searParam.getP(), searParam.getPage_per_count());
					endRow = calculateEndRow(firstRow, searParam.getPage_per_count(), totalArticleModelCount);
					mbbs_articleModelList = mbbs_ArticleDao.selectSearSort(firstRow, endRow, searParam);
				}else{
					//검색된 row 수로 전체 결과 페이지 수 결정.(각 페이지당 5개 row) 
					totalPageCount = calculateTotalPageCount_search(totalArticleModelCount, 5);
					
					//통합검색 후 section 당 로우 개수(5 개)로 시작과 끝 로우 결정. 
					firstRow = calculateFirstRow(searParam.getP(), 5);
					endRow = calculateEndRow(firstRow, 5, totalArticleModelCount);
					mbbs_articleModelList = mbbs_ArticleDao.selectSearSort(firstRow, endRow, searParam);
				}

				MBBS_ArticleListModel mbbs_articleListView = new MBBS_ArticleListModel(
						mbbs_articleModelList,  searParam.getP(), totalPageCount, firstRow,
						endRow, totalArticleModelCount, searParam.getPage_per_count());
				return mbbs_articleListView;
				
			} catch (SQLException e) {
				throw new RuntimeException("DB 에러 발생:" + e.getMessage(), e);
			} finally {
			}
		}
	
	
	private int calculateTotalPageCount_search(int totalArticleCount, int count_per_page) {
		if (totalArticleCount == 0) {
			return 0;
		}
		int pageCount = totalArticleCount / count_per_page;
		if (totalArticleCount % count_per_page > 0) {
			pageCount++;
		}
		return pageCount;
	}
	
	/**
	 * 검색 결과에서 첫번째 row 구하기.
	 * @param requestPageNumber
	 * @param count_per_page
	 * @return
	 */
	private int calculateFirstRow(int requestPageNumber, int count_per_page) {
		int firstRow = (requestPageNumber - 1) * count_per_page + 1;
		return firstRow;
	}
	
	/**
	 * 검색 결과에서  마지막 row 구하기.
	 * @param firstRow
	 * @param count_per_page
	 * @param totalStoreModelCount
	 * @return
	 */
	private int calculateEndRow(int firstRow, int count_per_page, int totalStoreModelCount) {
		int endRow = firstRow + count_per_page - 1;
		
		if (endRow > totalStoreModelCount) {
			endRow = totalStoreModelCount;
		}
		return endRow;
	}
	public ArrayList<MBBS_Article> random_3_List() throws SQLException {
		  return (ArrayList<MBBS_Article>) mbbs_ArticleDao.random_3_List();
		 
	}	 
}
		
	


