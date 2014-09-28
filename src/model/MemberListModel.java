package model;

import java.util.ArrayList;
import java.util.List;

// 아이디 ,비번을 검색시 저장할 정보
public class MemberListModel {

	private List<SearchMember> memberList;
	
	public MemberListModel() {
		this(new ArrayList<SearchMember>());
	}
	public MemberListModel(List<SearchMember> memberList){
		this.memberList = memberList;
	}
	
	
	public List<SearchMember> getMemberList() {
		return memberList;
	}
	public boolean isHasMember(){
		return ! memberList.isEmpty();
	}
}
