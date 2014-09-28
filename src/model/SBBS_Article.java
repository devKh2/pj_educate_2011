package model;

import org.springframework.web.multipart.MultipartFile;

public class SBBS_Article {

	private int 	sbbs_artid;
	private int 	sbbs_groupid;
	private String 	sbbs_arttype;
	private String 	sbbs_regdate;
	private int 	sbbs_count;
	private String 	sbbs_title;
	private String 	sbbs_content;
	private String 	cu_id;
	private String 	sbbs_SequenceNo;
	private String 	sbbs_picpath;
	private String sbbs_userpicname;
	private MultipartFile file;
	private String sbbs_picnum;
	private String st_type;
	private int st_num;
	
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
		if (sbbs_SequenceNo == null) {
			return -1;
		}
		if (sbbs_SequenceNo.length() != 16) {
			return -1;
		}
		if (sbbs_SequenceNo.endsWith("999999")) {
			return 0;
		}
		if (sbbs_SequenceNo.endsWith("9999")) {
			return 1;
		}
		if (sbbs_SequenceNo.endsWith("99")) {
			return 2;
		}
		return 3;
	}
	
	
	//set get method 부분 입니다.
	
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	
	public int getSbbs_artid() {
		return sbbs_artid;
	}
	public void setSbbs_artid(int sbbs_artid) {
		this.sbbs_artid = sbbs_artid;
	}
	public int getSbbs_groupid() {
		return sbbs_groupid;
	}
	public void setSbbs_groupid(int sbbs_groupid) {
		this.sbbs_groupid = sbbs_groupid;
	}
	public String getSbbs_arttype() {
		return sbbs_arttype;
	}
	public void setSbbs_arttype(String sbbs_arttype) {
		this.sbbs_arttype = sbbs_arttype;
	}
	public String getSbbs_regdate() {
		return sbbs_regdate;
	}
	public void setSbbs_regdate(String sbbs_regdate) {
		this.sbbs_regdate = sbbs_regdate;
	}
	public int getSbbs_count() {
		return sbbs_count;
	}
	public void setSbbs_count(int sbbs_count) {
		this.sbbs_count = sbbs_count;
	}
	public String getSbbs_title() {
		return sbbs_title;
	}
	public void setSbbs_title(String sbbs_title) {
		this.sbbs_title = sbbs_title;
	}
	public String getSbbs_content() {
		return sbbs_content;
	}
	public void setSbbs_content(String sbbs_content) {
		this.sbbs_content = sbbs_content;
	}
	public String getCu_id() {
		return cu_id;
	}
	public void setCu_id(String cu_id) {
		this.cu_id = cu_id;
	}
	public String getSbbs_SequenceNo() {
		return sbbs_SequenceNo;
	}
	public void setSbbs_SequenceNo(String sbbs_SequenceNo) {
		this.sbbs_SequenceNo = sbbs_SequenceNo;
	}
	public String getSbbs_picpath() {
		return sbbs_picpath;
	}
	public void setSbbs_picpath(String sbbs_picpath) {
		this.sbbs_picpath = sbbs_picpath;
	}
	public String getSbbs_userpicname() {
		return sbbs_userpicname;
	}
	public void setSbbs_userpicname(String sbbs_userpicname) {
		this.sbbs_userpicname = sbbs_userpicname;
	}
	public String getSbbs_picnum() {
		return sbbs_picnum;
	}
	public void setSbbs_picnum(String sbbs_picnum) {
		this.sbbs_picnum = sbbs_picnum;
	}
	public String getSt_type() {
		return st_type;
	}
	public void setSt_type(String st_type) {
		this.st_type = st_type;
	}
	public int getSt_num() {
		return st_num;
	}
	public void setSt_num(int st_num) {
		this.st_num = st_num;
	}
	

	
	
	
	
}
