package model;

import java.util.ArrayList;
import java.util.List;

public class MemberModelList {
	private List<Member> memberList;
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
	
	
	public MemberModelList(){
		this(new ArrayList<Member>(), 0, 0, 0, 0, 0, 0);
	}
	
	public MemberModelList(List<Member> memberList, int requestPageNumber, int totalPageCount, int firstRow, int endRow, int totalMenuCount, int count_per_num){
		this.memberList = memberList;
		this.requestPage = requestPageNumber;
		this.totalPageCount = totalPageCount;
		this.startRow = firstRow;
		this.endRow = endRow;
		this.totalMenuCount = totalMenuCount;
		processingPaging(count_per_num);
	}


	public List<Member> getMemberList() {
		return memberList;
	}


	public void setMemberList(List<Member> memberList) {
		this.memberList = memberList;
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


	public void setBeginPageNumber(int beginPageNumber) {
		this.beginPageNumber = beginPageNumber;
	}


	public int getEndPageNumber() {
		return endPageNumber;
	}


	public void setEndPageNumber(int endPageNumber) {
		this.endPageNumber = endPageNumber;
	}


	public int getRowTopNumber() {
		return rowTopNumber;
	}


	public void setRowTopNumber(int rowTopNumber) {
		this.rowTopNumber = rowTopNumber;
	}
	
	
}
