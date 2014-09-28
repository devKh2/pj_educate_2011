package model;

public class JoinRequest {
	private String preResident;  	// 주민번호 앞자리
	private String tailResident;	// 주민번호 뒷자리
	private String userName;		// 회원이름
	private String userID;			// 회원아이디
	private String userPW;			// 회원비밀번호
	private String userPWCheck;		// 회원 확인비밀번호
	private String cellNumber;		// 회원전화번호
	private String preEmail;		// 이메일 앞자리
	private String tailEmail;		// 이메일 뒷자리
	private String emailCheck;		// 이메일 인증번호
	private String preAddress;		// 주소 앞자리
	private String tailAddress;		// 주소 뒷자리
	
	
	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getPreResident() {
		return preResident;
	}

	public void setPreResident(String preResident) {
		this.preResident = preResident;
	}

	public String getTailResident() {
		return tailResident;
	}

	public void setTailResident(String tailResident) {
		this.tailResident = tailResident;
	}

	public String getUserPW() {
		return userPW;
	}

	public void setUserPW(String userPW) {
		this.userPW = userPW;
	}

	public String getUserPWCheck() {
		return userPWCheck;
	}

	public void setUserPWCheck(String userPWCheck) {
		this.userPWCheck = userPWCheck;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPreEmail() {
		return preEmail;
	}

	public void setPreEmail(String preEmail) {
		this.preEmail = preEmail;
	}

	public String getTailEmail() {
		return tailEmail;
	}

	public void setTailEmail(String tailEmail) {
		this.tailEmail = tailEmail;
	}
	
	

	public String getEmailCheck() {
		return emailCheck;
	}

	public void setEmailCheck(String emailCheck) {
		this.emailCheck = emailCheck;
	}

	public String getCellNumber() {
		return cellNumber;
	}

	public void setCellNumber(String cellNumber) {
		this.cellNumber = cellNumber;
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
		return "JoinRequest [preResident=" + preResident + ", tailResident="
				+ tailResident + ", userName=" + userName + ", userID="
				+ userID + ", userPW=" + userPW + ", userPWCheck="
				+ userPWCheck + ", cellNumber=" + cellNumber + ", preEmail="
				+ preEmail + ", tailEmail=" + tailEmail + ", emailCheck="
				+ emailCheck + ", preAddress=" + preAddress + ", tailAddress="
				+ tailAddress + "]";
	}
}
