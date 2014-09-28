package dao;

import java.sql.SQLException;
import java.util.List;

import model.EmailListModel;

public interface EmailAddrListDao {

	public List<EmailListModel> getCustomEmailAddr() throws SQLException;
	public List<EmailListModel> getStoreEmailAddr() throws SQLException;
}
