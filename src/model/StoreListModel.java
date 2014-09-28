package model;

import java.util.ArrayList;
import java.util.List;


public class StoreListModel {
	
	private List<StoreModel> storeList;		//가게list
	private int requestPage;		//요청 page
	private int totalPageCount;		//전체 페이지 count
	private int startRow;	//(페이지에 뿌려줄)첫번째 row num
	private int endRow;			//마지막 row num
	private int totalStoreCount;		//SELECT 된 전체 가게 수
	private int beginPageNumber;		//페이지 하단에 나타낼 시작 페이지 NUMBER
	private int endPageNumber;			//페이지 하단에 나타낼 마지막 페이지 NUMBER
	private int rowTopNumber;			
	
	private void processingPaging(int count_per_num){
		if(totalPageCount > 0){
			beginPageNumber = (requestPage - 1) / count_per_num * count_per_num + 1;
			endPageNumber = beginPageNumber + count_per_num - 1;
			if(endPageNumber > totalPageCount){
				endPageNumber = totalPageCount;
			}
		}
		rowTopNumber = totalStoreCount - ((requestPage-1) * count_per_num);
		System.out.println("3");
	}
	
	
	public StoreListModel() {
		this(new ArrayList<StoreModel>(), 0, 0, 0, 0, 0, 0);
	}
	
	
	public StoreListModel(List<StoreModel> storeList, int requestPage,
			int totalPageCount, int startRow, int endRow, int totalStoreCount, int count_per_num) {
		this.storeList = storeList;
		this.requestPage = requestPage;
		this.totalPageCount = totalPageCount;
		this.startRow = startRow;
		this.endRow = endRow;
		this.totalStoreCount = totalStoreCount;
		processingPaging(count_per_num);
	}


	public boolean isHasStore() {
		if(storeList.isEmpty()){
			System.out.println("StoreList Empty");
		}
		System.out.println("StoreList success");
		return !storeList.isEmpty();
	}
	public void setTotalStoreCount(int totalStoreCount) {
		this.totalStoreCount = totalStoreCount;
	}
	public List<StoreModel> getStoreList() {
		return storeList;
	}
	
	public int getTotalPageCount() {
		return totalPageCount;
	}

	public int getTotalStoreCount() {
		System.out.println("getTotalStoreCount:: " + totalStoreCount);
		return totalStoreCount;
	}
	
	public int getRequestPage() {
		return requestPage;
	}

	public int getStartRow() {
		return startRow;
	}

	public int getEndRow() {
		return endRow;
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
