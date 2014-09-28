package model;

import java.util.StringTokenizer;

public class Member {
	private String id;
	private String pw;
	private String userName;
	private int num;

	private String residentNum;
	private String preResident;
	private String tailResident;

	private String email;
	private String preEmail;
	private String tailEmail;


	private String phone;
	private String preAddress;
	private String tailAddress;

	private FavoriteSiteModel favoritesite;
	
	private String member_type;
	private int    st_num;
	private String joinDate;

	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getJoinDate() {
		return joinDate.replace(".", " ");
	}
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	
	public String getMember_type() {
		return member_type;
	}

	public void setMember_type(String member_type) {
		this.member_type = member_type;
	}

	public int getSt_num() {
		return st_num;
	}

	public void setSt_num(int st_num) {
		this.st_num = st_num;
	}

	public FavoriteSiteModel getFavoritesite() {
		return favoritesite;
	}

	public void setFavoritesite(FavoriteSiteModel favoritesite) {
		this.favoritesite = favoritesite;
	}



	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getResidentNum() {
		return residentNum;
	}

	public void setResidentNum(String residentNum) {
		this.residentNum = residentNum;
		setPreResident();
		setTailResident();
	}

	public String getPreResident() {

		return preResident;
	}

	public void setPreResident() {
		this.preResident = this.residentNum.substring(0, 5);
	}

	public String getTailResident() {
		return tailResident;
	}

	public void setTailResident() {
		this.tailResident = this.residentNum.substring(6, 12);
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
		setPreEmail();
		setTailEmail();
	}

	public String getPreEmail() {
		return preEmail;
	}

	public void setPreEmail() {
		StringTokenizer st = new StringTokenizer(this.email, "@");
		if (st.hasMoreTokens()) {
			this.preEmail = st.nextToken();
		}
	}

	public String getTailEmail() {
		return tailEmail;
	}

	public void setTailEmail() {
		this.tailEmail = this.email.substring(preEmail.length() + 1);
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPreAddress() {
		return preAddress;
	}

	public void setPreAddress(String preAddress) {
		this.preAddress = preAddress;
	}

	public String getTailAddress() {
		return tailAddress;
	}

	public void setTailAddress(String tailAddress) {
		this.tailAddress = tailAddress;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pw=" + pw + ", userName=" + userName
				+ ", residentNum=" + residentNum + ", preResident="
				+ preResident + ", tailResident=" + tailResident + ", email="
				+ email + ", preEmail=" + preEmail + ", tailEmail=" + tailEmail
				+ ", phone=" + phone + ", preAddress=" + preAddress
				+ ", tailAddress=" + tailAddress + ", getId()=" + getId()
				+ ", getPw()=" + getPw() + ", getUserName()=" + getUserName()
				+ ", getResidentNum()=" + getResidentNum()
				+ ", getPreResident()=" + getPreResident()
				+ ", getTailResident()=" + getTailResident() + ", getEmail()="
				+ getEmail() + ", getPreEmail()=" + getPreEmail()
				+ ", getTailEmail()=" + getTailEmail() + ", getPhone()="
				+ getPhone() + ", getPreAddress()=" + getPreAddress()
				+ ", getTailAddress()=" + getTailAddress() + "]";
	}
}
