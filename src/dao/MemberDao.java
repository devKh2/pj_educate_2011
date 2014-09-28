package dao;

import java.sql.SQLException;
import java.util.List;

import model.JoinRequest;
import model.Member;
import model.SearchMember;



public interface MemberDao {
	public boolean isExist(String id) throws SQLException;
	public int insert(JoinRequest jr) throws SQLException;
	public int modified(JoinRequest jr) throws SQLException;
	public Member login(String id, String pw) throws SQLException;
	List<Member> getMemberList(int firstRow, int endRow, String keyWord) throws SQLException;
	int getMemberCount(String keyWord) throws SQLException;
	int deleteMember(String id) throws SQLException;
	public List<SearchMember> IdSearch(String name, String preResidentNum, String tailResidentNum) throws SQLException;
	public List<SearchMember> IdSearch(String name) throws SQLException;
	public List<SearchMember> PwSearch(String name, String preResidentNum, String tailResidentNum, String id) throws SQLException;
	
	public Member admin_login(String id, String pw) throws SQLException;		//관리자 로그인처리
	public Member store_login(String id, String pw) throws SQLException;		//가게 로그인처리
	
	public int insertFavoriteSite(String st_num,String id) throws SQLException;
}
