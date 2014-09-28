package model;

import java.util.ArrayList;
import java.util.List;

public class MenuListModel {
	private List<MenuModel> menuList;
	private int requestPage;
	private int totalPageCount;
	private int startRow;
	private int endRow;
	private int totalMenuCount;
	private int beginPageNumber;
	private int endPageNumber;
	private int rowTopNumber;
	
	private void processingPaging(int count_per_num){
		if(totalPageCount > 0){
			beginPageNumber = (requestPage - 1) / count_per_num * count_per_num + 1;
			endPageNumber = beginPageNumber + count_per_num - 1;
			if(endPageNumber > totalPageCount){
				endPageNumber = totalPageCount;
			}
		}
		rowTopNumber = totalMenuCount - ((requestPage-1) * count_per_num);
	}
	
	
	public MenuListModel(){
		this(new ArrayList<MenuModel>(), 0, 0, 0, 0, 0, 0);
	}
	
	public MenuListModel(List<MenuModel> menuList, int requestPageNumber, int totalPageCount, int firstRow, int endRow, int totalMenuCount, int count_per_num){
		this.menuList = menuList;
		this.requestPage = requestPageNumber;
		this.totalPageCount = totalPageCount;
		this.startRow = firstRow;
		this.endRow = endRow;
		this.totalMenuCount = totalMenuCount;
		processingPaging(count_per_num);
	}
	
	
	public boolean isHasMenu() {
		return !menuList.isEmpty();
	}
	
	public List<MenuModel> getMenuList() {
		return menuList;
	}
	public void setMenuList(List<MenuModel> menuList) {
		this.menuList = menuList;
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
	public int getTotalMenuCount() {
		return totalMenuCount;
	}
	public void setTotalMenuCount(int totalMenuCount) {
		this.totalMenuCount = totalMenuCount;
	}

	public int getBeginPageNumber() {
		return beginPageNumber;
	}

	public int getEndPageNumber() {
		return endPageNumber;
	}

	public int getRowTopNumber() {
		return rowTopNumber;
	}
}
