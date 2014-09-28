package model;

public class SBBS_UpdateRequest {

	private String member_id;
	private String cu_id;
	private String sbbs_title;
	private String sbbs_content;
	private int sbbs_artid;
	private int st_num;
	
	//------set get method--------------------------
	
	public String getMember_id() {
		return member_id;
	}
	public int getSt_num() {
		return st_num;
	}
	public void setSt_num(int st_num) {
		this.st_num = st_num;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
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
	public int getSbbs_artid() {
		return sbbs_artid;
	}
	public void setSbbs_artid(int sbbs_artid) {
		this.sbbs_artid = sbbs_artid;
	}
	public String getCu_id() {
		return cu_id;
	}
	public void setCu_id(String cu_id) {
		this.cu_id = cu_id;
	}
	
	
}
