package model;

import java.util.ArrayList;
import java.util.List;

public class StatsListModel {
	private List<DayOfStats_Total> statsList ;		// �˻��� ����� ������ ����Ʈ
	private String date;							// ���� ��¥ �����ϱ� ���� �ʵ�
	private String viewDate;						// �Խ��ǿ� ������ ��¥String
	
	
	private int totalProfit;
	private int st_num;
	private String st_name;

	
	public StatsListModel() {
		this(new ArrayList<DayOfStats_Total>());
	}

	public StatsListModel(List<DayOfStats_Total> statsList) {
		this.statsList = statsList;
	}

	public List<DayOfStats_Total> getStatsList() {
		return statsList;
	}

	public boolean isHasStats(){
		return ! statsList.isEmpty();
	}
	
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getViewDate() {
		return viewDate;
	}

	public void setViewDate(String viewDate) {
		this.viewDate = viewDate;
	}

	public int getTotalProfit() {
		return totalProfit;
	}

	public void setTotalProfit(int totalProfit) {
		this.totalProfit = totalProfit;
	}

	public int getSt_num() {
		return st_num;
	}

	public void setSt_num(int st_num) {
		this.st_num = st_num;
	}

	public String getSt_name() {
		return st_name;
	}

	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}



	
	
}
