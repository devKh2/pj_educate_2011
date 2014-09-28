package model;

import org.springframework.web.multipart.MultipartFile;


public class SBBS_ReplyingRequest {
	
	private int parent_sbbs_artid;
	
	private String 	sbbs_arttype;
	private String 	sbbs_title;
	private String 	sbbs_content;
	private String 	cu_id;
	private MultipartFile file;
	private String st_type;
	private int st_num;

	//--set get Method 구현부분.
	
	public int getSt_num() {
		return st_num;
	}

	public void setSt_num(int stnum) {
		this.st_num = stnum;
	}

	public String getSt_type() {
		return st_type;
	}

	public void setSt_type(String st_type) {
		this.st_type = st_type;
	}

	public int getParent_sbbs_artid() {
		return parent_sbbs_artid;
	}

	public void setParent_sbbs_artid(int parent_sbbs_artid) {
		this.parent_sbbs_artid = parent_sbbs_artid;
	}

	public String getSbbs_arttype() {
		return sbbs_arttype;
	}

	public void setSbbs_arttype(String sbbs_arttype) {
		this.sbbs_arttype = sbbs_arttype;
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

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public SBBS_Article toArticle(){
		SBBS_Article sbbs_Article = new SBBS_Article();
		sbbs_Article.setCu_id(cu_id);
		sbbs_Article.setFile(file);
		sbbs_Article.setSbbs_arttype(sbbs_arttype);
		sbbs_Article.setSbbs_title(sbbs_title);
		sbbs_Article.setSbbs_content(sbbs_content);
		sbbs_Article.setSt_num(st_num);
		return sbbs_Article;
	}
	

}
