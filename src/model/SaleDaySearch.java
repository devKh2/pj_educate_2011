package model;

import java.sql.Date;

public class SaleDaySearch {

	private String date;			//실제로 쿼리문으로 보낼 날짜  2011/2/1
	private String st_name;	
	private int st_num;
	
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	

	public String getSt_name() {
		return st_name;
	}
	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}
	public int getSt_num() {
		return st_num;
	}
	public void setSt_num(int st_num) {
		this.st_num = st_num;
	}

}
