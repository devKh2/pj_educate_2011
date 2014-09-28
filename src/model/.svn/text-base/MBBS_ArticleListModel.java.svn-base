package model;

import java.util.ArrayList;
import java.util.List;

public class MBBS_ArticleListModel {
	
	private List<MBBS_Article> articleList;
	private int totalArticleCount;	//총 게시물 수
	private int requestPage;
	private int totalPageCount;
	private int startRow;
	private int endRow;
	private int count_per_num;
	private int beginPageNumber;		//페이지 하단에 나타낼 시작 페이지 NUMBER
	private int endPageNumber;			//페이지 하단에 나타낼 마지막 페이지 NUMBER
	
	private void processingPaging(int count_per_num){
		if(totalPageCount > 0){
			beginPageNumber = (requestPage - 1) / count_per_num * count_per_num + 1;
			endPageNumber = beginPageNumber + count_per_num - 1;
			if(endPageNumber > totalPageCount){
				endPageNumber = totalPageCount;
			}
		}
	
	}
	

	public MBBS_ArticleListModel() {
		this(new ArrayList<MBBS_Article>(), 0, 0, 0, 0, 0, 0);
	}
	
	public MBBS_ArticleListModel(List<MBBS_Article> articleList, int requestPageNumber,
			int totalPageCount, int startRow, int endRow, int totalArticleCount, int count_per_num) {
		this.articleList = articleList; 
		this.requestPage = requestPageNumber;
		this.totalPageCount = totalPageCount;
		this.startRow = startRow;
		this.endRow = endRow;
		this.totalArticleCount = totalArticleCount;
		processingPaging(count_per_num);
	}
	

	public int getBeginPageNumber() {
		return beginPageNumber;
	}


	public int getEndPageNumber() {
		return endPageNumber;
	}


	public int getCount_per_num() {
		return count_per_num;
	}

	public void setCount_per_num(int count_per_num) {
		this.count_per_num = count_per_num;
	}

	
	public int getTotalArticleCount() {
		return totalArticleCount;
	}

	public void setTotalArticleCount(int totalArticleCount) {
		this.totalArticleCount = totalArticleCount;
	}

	public List<MBBS_Article> getArticleList() {
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
