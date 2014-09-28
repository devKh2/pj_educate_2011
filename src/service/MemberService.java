package service;

import java.sql.SQLException;

import model.MemberModelList;
import model.SearchParam;

public interface MemberService {
	MemberModelList getMemberList(SearchParam searParam) throws SQLException;
	int deleteMember(String id) throws SQLException;
}
