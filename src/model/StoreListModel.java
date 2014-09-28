package model;

import java.util.ArrayList;
import java.util.List;


public class StoreListModel {
	
	private List<StoreModel> storeList;		//����list
	private int requestPage;		//��û page
	private int totalPageCount;		//��ü ������ count
	private int startRow;	//(�������� �ѷ���)ù��° row num
	private int endRow;			//������ row num
	private int totalStoreCount;		//SELECT �� ��ü ���� ��
	private int beginPageNumber;		//������ �ϴܿ� ��Ÿ�� ���� ������ NUMBER
	private int endPageNumber;			//������ �ϴܿ� ��Ÿ�� ������ ������ NUMBER
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
