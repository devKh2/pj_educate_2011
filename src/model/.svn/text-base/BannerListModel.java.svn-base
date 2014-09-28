package model;

import java.util.ArrayList;
import java.util.List;

public class BannerListModel {

	
	private List<Banner> list;
	
	private int totalBannerCount;	// 게시판 글 갯수
	private int requestPage;		// 요구한 페이지
	private int totalPageCount;		// 총 페이지 수
	private int startRow;			// 시작 행
	private int endRow;				// 마지막 행
	
	public BannerListModel() {
		this(new ArrayList<Banner>(), 0, 0, 0, 0);
	}
	
	public BannerListModel(List<Banner> list){
		this.list = list;
	}
	
	public BannerListModel(List<Banner> list, int requestPageNumber, int totalPageCount, int startRow, int endRow) {
		this.list = list;				// 
		this.requestPage = requestPageNumber;		// 요구한 페이즈는 1
		this.totalPageCount = totalPageCount;		// 총 페이지 수는 1
		this.startRow = startRow;					// 시작row는 1
		this.endRow = endRow;						// 마지막 row는 10
	}
	
	public boolean isHasBanner() {
		return ! list.isEmpty();
	}

	public List<Banner> getList() {
		return list;
	}

	public void setList(List<Banner> list) {
		this.list = list;
	}

	public int getTotalBannerCount() {
		return totalBannerCount;
	}

	public void setTotalBannerCount(int totalBannerCount) {
		this.totalBannerCount = totalBannerCount;
	}

	public int getRequestPage() {
		return requestPage;
	}

	public void setRequestPage(int requestPage) {
		this.requestPage = requestPage;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	
	
}
