package service.bbs.sbbs;


import java.sql.SQLException;
import java.util.List;

import model.SBBS_Article;
import model.SBBS_ArticleListModel;

import org.apache.log4j.Logger;


import dao.SBBS_ArticleDao;


public class SBBS_ListServiceImpl implements SBBS_ListService {
	static Logger logger = Logger.getLogger(SBBS_ListServiceImpl.class);
	
	private SBBS_ArticleDao sbbs_ArticleDao;
	
	public void setSbbs_ArticleDao(SBBS_ArticleDao sbbs_ArticleDao) {
		this.sbbs_ArticleDao = sbbs_ArticleDao;
	}

	public SBBS_ArticleListModel getArticleList(int requestPageNumber,String searchkind,String search,String stnum) {
		if (requestPageNumber < 0) {
			throw new IllegalArgumentException("page number < 0 : "
					+ requestPageNumber);
		}
		try {
			int totalArticleCount = sbbs_ArticleDao.selectCount(searchkind,search,stnum);
			logger.debug("totalArticleCount=" + totalArticleCount);
			
			//totalArticleCount가 0이면 새로 생성된 ArticleListModel 을 리턴함. 
			if (totalArticleCount == 0) {
				return new SBBS_ArticleListModel();
			}

			int totalPageCount = calculateTotalPageCount(totalArticleCount);

			int firstRow = (requestPageNumber - 1) * COUNT_PER_PAGE + 1;
			int endRow = firstRow + COUNT_PER_PAGE - 1;

			if (endRow > totalArticleCount) {
				endRow = totalArticleCount;
			}
			logger.debug("firstRow="+firstRow);
			logger.debug("endRow="+endRow);
			
			List<SBBS_Article> articleList 
					= sbbs_ArticleDao.select(firstRow,endRow,searchkind, search,stnum);
			
			SBBS_ArticleListModel articleListView = new SBBS_ArticleListModel(
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
