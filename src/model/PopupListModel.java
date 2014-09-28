package model;

import java.util.ArrayList;
import java.util.List;


public class PopupListModel {

	private List<Popup> list;
	
	private int totalArticleCount;	// �Խ��� �� ����
	private int requestPage;		// �䱸�� ������
	private int totalPageCount;		// �� ������ ��
	private int startRow;			// ���� ��
	private int endRow;				// ������ ��
	
	private int presentPopup;		// ���� ���� �Ǵ� �˾��� ���� 
	
	public int getPresentPopup() {
		return presentPopup;
	}

	public void setPresentPopup(int presentPopup) {
		this.presentPopup = presentPopup;
	}

	public PopupListModel() {
		this(new ArrayList<Popup>(), 0, 0, 0, 0);
	}
	
	public PopupListModel(List<Popup> list){
		this.list = list;
	}
	
	public PopupListModel(List<Popup> list, int requestPageNumber, int totalPageCount, int startRow, int endRow) {
		this.list = list;				// 
		this.requestPage = requestPageNumber;		// �䱸�� ������� 1
		this.totalPageCount = totalPageCount;		// �� ������ ���� 1
		this.startRow = startRow;					// ����row�� 1
		this.endRow = endRow;						// ������ row�� 10
	}
	
	public boolean isHasPopup() {
		return ! list.isEmpty();
	}
	
	public List<Popup> getList() {
		return list;
	}
	public void setList(List<Popup> list) {
		this.list = list;
	}
	public int getTotalArticleCount() {
		return totalArticleCount;
	}
	public void setTotalArticleCount(int totalArticleCount) {
		this.totalArticleCount = totalArticleCount;
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
