package dao;

import java.sql.SQLException;

import model.Admin;

public interface AdminDao {
	//관리자 정보를 DB에서 받아 온다.
	public Admin getAdmin() throws SQLException ;
	int update(Admin admin) throws SQLException;
}
