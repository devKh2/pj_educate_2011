package service.bbs.ebbs;


import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.EBBS_Article;
import model.EBBS_ArticleListModel;
import model.Random4_EBBS;

import org.apache.log4j.Logger;

import dao.EBBS_ArticleDao;



public class EBBS_ListServiceImpl implements EBBS_ListService {
	static Logger logger = Logger.getLogger(EBBS_ListServiceImpl.class);
	
	private EBBS_ArticleDao ebbs_ArticleDao;
	
	public void setEbbs_ArticleDao(EBBS_ArticleDao ebbs_ArticleDao) {
		this.ebbs_ArticleDao = ebbs_ArticleDao;
	}

	public EBBS_ArticleListModel getArticleList(int requestPageNumber,String searchkind,String search,String stnum) {
		if (requestPageNumber < 0) {
			throw new IllegalArgumentException("page number < 0 : "
					+ requestPageNumber);
		}
		
		try {
			System.out.println("서비스안에"+stnum);
			int totalArticleCount = ebbs_ArticleDao.selectCount(Integer.parseInt(stnum));
			System.out.println("서비스안에"+totalArticleCount);
			logger.debug("totalArticleCount=" + totalArticleCount);
			
			//totalArticleCount가 0이면 새로 생성된 ArticleListModel 을 리턴함. 
			if (totalArticleCount == 0) {
				return new EBBS_ArticleListModel();
			}

			int totalPageCount = calculateTotalPageCount(totalArticleCount);

			int firstRow = (requestPageNumber - 1) * COUNT_PER_PAGE + 1;
			int endRow = firstRow + COUNT_PER_PAGE - 1;

			if (endRow > totalArticleCount) {
				endRow = totalArticleCount;
			}
			logger.debug("firstRow="+firstRow);
			logger.debug("endRow="+endRow);
			
			List<EBBS_Article> articleList 
					= ebbs_ArticleDao.select(firstRow,endRow,Integer.valueOf(stnum));
			
			EBBS_ArticleListModel articleListView = new EBBS_ArticleListModel(
					articleList, requestPageNumber, totalPageCount, firstRow,
					endRow);
			//총 게시물 수 셋팅
			articleListView.setTotalArticleCount(totalArticleCount);
			
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
	
	public ArrayList<Random4_EBBS> get_4list() throws SQLException{
		return ebbs_ArticleDao.get_4list();
	}
	

}
