package model;

import java.util.ArrayList;
import java.util.List;

public class NBBS_ArticleListModel {
	
	private List<NBBS_Article> articleList;
	private int totalArticleCount;	//ÃÑ °Ô½Ã¹° ¼ö
	private int requestPage;
	private int totalPageCount;
	private int startRow;
	private int endRow;

	public NBBS_ArticleListModel() {
		this(new ArrayList<NBBS_Article>(), 0, 0, 0, 0);
	}
	
	public NBBS_ArticleListModel(List<NBBS_Article> articleList, int requestPageNumber,
			int totalPageCount, int startRow, int endRow) {
		this.articleList = articleList;
		this.requestPage = requestPageNumber;
		this.totalPageCount = totalPageCount;
		this.startRow = startRow;
		this.endRow = endRow;
	}
	
	public int getTotalArticleCount() {
		return totalArticleCount;
	}

	public void setTotalArticleCount(int totalArticleCount) {
		this.totalArticleCount = totalArticleCount;
	}

	public List<NBBS_Article> getArticleList() {
		return articleList;
	}
	
	public boolean isHasArticle() {
		return ! articleList.isEmpty();
	}

	public int getRequestPage() {
		return requestPage;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public int getStartRow() {
		return startRow;
	}

	public int getEndRow() {
		return endRow;
	}
	
}
