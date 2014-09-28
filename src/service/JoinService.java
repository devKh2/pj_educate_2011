package service;

import java.sql.SQLException;

import model.JoinRequest;
import model.Member;

public interface JoinService {

	public int join(JoinRequest jr);
	public int modified(JoinRequest jr);
	public boolean isExist(String id);
	public Member login(String id, String pw);
	
	public Member adminMember_login(String id, String pw);  // ������ �α���ó��
	public Member storeMember_login(String id, String pw);  // ���� ���� �α���ó��
	
	public int insertFavoriteSite(String st_num,String id) throws SQLException;
}
