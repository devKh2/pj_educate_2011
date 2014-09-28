package model;

public class NBBS_Article {

	private int 	notice_artid;
	private String 	notice_regdate;
	private int 	notice_count;
	private String 	notice_title;
	private String 	notice_content;
	private String 	admin_id;
	
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

	//set get method 부분 입니다.

	public int getNotice_artid() {
		return notice_artid;
	}
	public void setNotice_artid(int notice_artid) {
		this.notice_artid = notice_artid;
	}
	public String getNotice_regdate() {
		return notice_regdate;
	}
	public void setNotice_regdate(String notice_regdate) {
		this.notice_regdate = notice_regdate;
	}
	public int getNotice_count() {
		return notice_count;
	}
	public void setNotice_count(int notice_count) {
		this.notice_count = notice_count;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	
	
	
	
}
