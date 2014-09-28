package model;

public class EBBS_Article {

	private int 	ebbs_artid;	
	private String 	ebbs_regdate;
	private String 	ebbs_title;
	private String 	cu_id;
	private int 	ebbs_score;
	private int 	st_num;
	
	//-------------------------------
	private double elpasedTime;
	private boolean newArticleYN;
	//-------------------------------
	
	//-------------------------------
	public boolean isNewArticleYN() {
		if(elpasedTime > 0){
			setNewArticleYN(false);
		}else{
			setNewArticleYN(true);
		}
		return newArticleYN;
	}
	public void setNewArticleYN(boolean newArticleYN) {
		this.newArticleYN = newArticleYN;
	}
	
	public double getElpasedTime() {
		return elpasedTime;
	}
	public void setElpasedTime(double elpasedTime) {
		this.elpasedTime = elpasedTime;
	}
	
	//-------------------------------
	
	
	
	//-------------------------------


	
	
	//set get method 부분 입니다.
	

	public String getCu_id() {
		return cu_id;
	}
	public void setCu_id(String cu_id) {
		this.cu_id = cu_id;
	}
	public int getEbbs_artid() {
		return ebbs_artid;
	}
	public void setEbbs_artid(int ebbs_artid) {
		this.ebbs_artid = ebbs_artid;
	}
	public String getEbbs_regdate() {
		return ebbs_regdate;
	}
	public void setEbbs_regdate(String ebbs_regdate) {
		this.ebbs_regdate = ebbs_regdate;
	}
	
	public String getEbbs_title() {
		return ebbs_title;
	}
	public void setEbbs_title(String ebbs_title) {
		this.ebbs_title = ebbs_title;
	}
	

	public int getEbbs_score() {
		return ebbs_score;
	}
	public void setEbbs_score(int ebbs_score) {
		this.ebbs_score = ebbs_score;
	}
	public int getSt_num() {
		return st_num;
	}
	public void setSt_num(int st_num) {
		this.st_num = st_num;
	}

	
	
	
}
