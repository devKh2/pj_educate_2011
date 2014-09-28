package model;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

public class Banner {

	private int ban_artid;
	private String ban_position;
	private String ban_title;
	private String ban_startDate;
	private String ban_endDate;
	private String ban_situation;
	private String ban_registDate;
	
	private MultipartFile file;
	private String ban_picNum;
	private String ban_picpath;
	
	private Timestamp sd;
	private Timestamp ed;
	private String ban_linkAddr;
	
	
	public String getBan_linkAddr() {
		return ban_linkAddr;
	}
	public void setBan_linkAddr(String ban_linkAddr) {
		this.ban_linkAddr = ban_linkAddr;
	}
	public Timestamp getSd() {
		return sd;
	}
	public void setSd(Timestamp sd) {
		this.sd = sd;
	}
	public Timestamp getEd() {
		return ed;
	}
	public void setEd(Timestamp ed) {
		this.ed = ed;
	}
	
	public String getBan_position() {
		return ban_position;
	}
	public void setBan_position(String ban_position) {
		this.ban_position = ban_position;
	}
	public int getBan_artid() {
		return ban_artid;
	}
	public void setBan_artid(int ban_artid) {
		this.ban_artid = ban_artid;
	}
	public String getBan_title() {
		return ban_title;
	}
	public void setBan_title(String ban_title) {
		this.ban_title = ban_title;
	}
	public String getBan_startDate() {
		return ban_startDate;
	}
	public void setBan_startDate(String ban_startDate) {
		this.ban_startDate = ban_startDate;
	}
	public String getBan_endDate() {
		return ban_endDate;
	}
	public void setBan_endDate(String ban_endDate) {
		this.ban_endDate = ban_endDate;
	}
	public String getBan_situation() {
		return ban_situation;
	}
	public void setBan_situation(String ban_situation) {
		this.ban_situation = ban_situation;
	}
	public String getBan_registDate() {
		return ban_registDate;
	}
	public void setBan_registDate(String ban_registDate) {
		this.ban_registDate = ban_registDate;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getBan_picNum() {
		return ban_picNum;
	}
	public void setBan_picNum(String ban_picNum) {
		this.ban_picNum = ban_picNum;
	}
	public String getBan_picpath() {
		return ban_picpath;
	}
	public void setBan_picpath(String ban_picpath) {
		this.ban_picpath = ban_picpath;
	}
	
	

	
}
