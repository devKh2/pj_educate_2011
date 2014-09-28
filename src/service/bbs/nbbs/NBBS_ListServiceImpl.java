package service.bbs.nbbs;


import java.sql.SQLException;
import java.util.List;

import model.NBBS_Article;
import model.NBBS_ArticleListModel;

import org.apache.log4j.Logger;

import dao.NBBS_ArticleDao;

public class NBBS_ListServiceImpl implements NBBS_ListService {
	static Logger logger = Logger.getLogger(NBBS_ListServiceImpl.class);
	
	private NBBS_ArticleDao nbbs_ArticleDao;

	public void setNbbs_ArticleDao(NBBS_ArticleDao nbbs_ArticleDao) {
		this.nbbs_ArticleDao = nbbs_ArticleDao;
	}

	public NBBS_ArticleListModel getArticleList(int requestPageNumber,String searchkind,String search) {
		if (requestPageNumber < 0) {
			throw new IllegalArgumentException("page number < 0 : "
					+ requestPageNumber);
		}
		
		try {
			int totalArticleCount = nbbs_ArticleDao.selectCount(searchkind,search);
			logger.debug("totalArticleCount=" + totalArticleCount);
			
			//totalArticleCount가 0이면 새로 생성된 ArticleListModel 을 리턴함. 
			if (totalArticleCount == 0) {
				return new NBBS_ArticleListModel();
			}

			int totalPageCount = calculateTotalPageCount(totalArticleCount);

			int firstRow = (requestPageNumber - 1) * COUNT_PER_PAGE + 1;
			int endRow = firstRow + COUNT_PER_PAGE - 1;

			if (endRow > totalArticleCount) {
				endRow = totalArticleCount;
			}
			logger.debug("firstRow="+firstRow);
			logger.debug("endRow="+endRow);
			
			List<NBBS_Article> articleList 
					= nbbs_ArticleDao.select(firstRow,endRow,searchkind, search);
			
			NBBS_ArticleListModel articleListView = new NBBS_ArticleListModel(
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

}
