package model;

import org.springframework.web.multipart.MultipartFile;

public class MBBS_Article {

	private int 	mbbs_artid;
	private int 	mbbs_groupid;
	private String 	mbbs_arttype;
	private String 	mbbs_regdate;
	private int 	mbbs_count;
	private String 	mbbs_title;
	private String 	mbbs_content;
	private String 	cu_id;
	private String 	mbbs_SequenceNo;
	private String 	mbbs_picpath;
	private String mbbs_userpicname;
	private MultipartFile file;
	private String mbbs_picnum;
	
	public String getMbbs_picnum() {
		return mbbs_picnum;
	}
	public void setMbbs_picnum(String mbbs_picnum) {
		this.mbbs_picnum = mbbs_picnum;
	}
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

	public int getLevel() {
		if (mbbs_SequenceNo == null) {
			return -1;
		}
		if (mbbs_SequenceNo.length() != 16) {
			return -1;
		}
		if (mbbs_SequenceNo.endsWith("999999")) {
			return 0;
		}
		if (mbbs_SequenceNo.endsWith("9999")) {
			return 1;
		}
		if (mbbs_SequenceNo.endsWith("99")) {
			return 2;
		}
		return 3;
	}
	
	
	//set get method 부분 입니다.
	
	public String getMbbs_userpicname() {
		return mbbs_userpicname;
	}
	public void setMbbs_userpicname(String mbbs_userpicname) {
		this.mbbs_userpicname = mbbs_userpicname;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	public String getMbbs_SequenceNo() {
		return mbbs_SequenceNo;
	}
	public void setMbbs_SequenceNo(String mbbs_SequenceNo) {
		this.mbbs_SequenceNo = mbbs_SequenceNo;
	}
	public int getMbbs_artid() {
		return mbbs_artid;
	}
	public void setMbbs_artid(int mbbs_artid) {
		this.mbbs_artid = mbbs_artid;
	}
	public int getMbbs_groupid() {
		return mbbs_groupid;
	}
	public void setMbbs_groupid(int mbbs_groupid) {
		this.mbbs_groupid = mbbs_groupid;
	}
	public String getMbbs_arttype() {
		return mbbs_arttype;
	}
	public void setMbbs_arttype(String mbbs_arttype) {
		this.mbbs_arttype = mbbs_arttype;
	}
	public String getMbbs_regdate() {
		return mbbs_regdate;
	}
	public void setMbbs_regdate(String mbbs_regdate) {
		this.mbbs_regdate = mbbs_regdate;
	}
	public int getMbbs_count() {
		return mbbs_count;
	}
	public void setMbbs_count(int mbbs_count) {
		this.mbbs_count = mbbs_count;
	}
	public String getMbbs_title() {
		return mbbs_title;
	}
	public void setMbbs_title(String mbbs_title) {
		this.mbbs_title = mbbs_title;
	}
	public String getMbbs_content() {
		return mbbs_content;
	}
	public void setMbbs_content(String mbbs_content) {
		this.mbbs_content = mbbs_content;
	}
	public String getCu_id() {
		return cu_id;
	}
	public void setCu_id(String cu_id) {
		this.cu_id = cu_id;
	}
	public String getMbbs_picpath() {
		return mbbs_picpath;
	}
	public void setMbbs_picpath(String mbbs_picpath) {
		this.mbbs_picpath = mbbs_picpath;
	}
	
	
	
}
