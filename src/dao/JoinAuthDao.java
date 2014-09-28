package dao;

import java.sql.SQLException;

import model.AuthNumModel;

public interface JoinAuthDao {

	public int insert(AuthNumModel authNumModel) throws SQLException;
	public boolean isExist(AuthNumModel authNumModel) throws SQLException;
	public boolean isEmailExist(String email) throws SQLException;
	public int emailDelete(String email) throws SQLException;
}
