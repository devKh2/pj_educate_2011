package model;

import org.springframework.web.multipart.MultipartFile;

public class MenuModel {
	private String st_num;
	private String menu_num;
	private String menu_comment;
	private int menu_price;
	private String menu_name;
	private String menu_picpath;
	private String st_name;
	private MultipartFile file;
	private String menu_picnum;
	private String st_sido;
	private String st_gugun;

	
	public String getSt_sido() {
		return st_sido;
	}
	public void setSt_sido(String st_sido) {
		this.st_sido = st_sido;
	}
	public String getSt_gugun() {
		return st_gugun;
	}
	public void setSt_gugun(String st_gugun) {
		this.st_gugun = st_gugun;
	}
	public String getMenu_picnum() {
		return menu_picnum;
	}
	public void setMenu_picnum(String menu_picnum) {
		this.menu_picnum = menu_picnum;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getSt_num() {
		return st_num;
	}
	public void setSt_num(String st_num) {
		this.st_num = st_num;
	}
	
	public String getSt_name() {
		return st_name;
	}
	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}
	public String getMenu_num() {
		return menu_num;
	}
	public void setMenu_num(String menu_num) {
		this.menu_num = menu_num;
	}
	public String getMenu_comment() {
		return menu_comment;
	}
	public void setMenu_comment(String menu_comment) {
		this.menu_comment = menu_comment;
	}
	public int getMenu_price() {
		return menu_price;
	}
	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public String getMenu_picpath() {
		return menu_picpath;
	}
	public void setMenu_picpath(String menu_picpath) {
		this.menu_picpath = menu_picpath;
	}

}
