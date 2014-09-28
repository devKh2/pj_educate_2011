package model;

public class MBBS_UpdateRequest {

	private String member_id;
	private String cu_id;
	private String mbbs_title;
	private String mbbs_content;
	private int mbbs_artid;
	
	//------set get method--------------------------
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
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
	public int getMbbs_artid() {
		return mbbs_artid;
	}
	public void setMbbs_artid(int mbbs_artid) {
		this.mbbs_artid = mbbs_artid;
	}
	public String getCu_id() {
		return cu_id;
	}
	public void setCu_id(String cu_id) {
		this.cu_id = cu_id;
	}
	
	
}
