package model;

import java.util.ArrayList;
import java.util.List;

public class BannerListModel {

	
	private List<Banner> list;
	
	private int totalBannerCount;	// �Խ��� �� ����
	private int requestPage;		// �䱸�� ������
	private int totalPageCount;		// �� ������ ��
	private int startRow;			// ���� ��
	private int endRow;				// ������ ��
	
	public BannerListModel() {
		this(new ArrayList<Banner>(), 0, 0, 0, 0);
	}
	
	public BannerListModel(List<Banner> list){
		this.list = list;
	}
	
	public BannerListModel(List<Banner> list, int requestPageNumber, int totalPageCount, int startRow, int endRow) {
		this.list = list;				// 
		this.requestPage = requestPageNumber;		// �䱸�� ������� 1
		this.totalPageCount = totalPageCount;		// �� ������ ���� 1
		this.startRow = startRow;					// ����row�� 1
		this.endRow = endRow;						// ������ row�� 10
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
