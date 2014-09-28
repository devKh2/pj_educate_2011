package dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import model.Admin;

public class AdminDaoImpl implements AdminDao {

	SqlMapClient sqlMapClient;
	
	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}
	@Override
	public Admin getAdmin() throws SQLException {
		Admin admin = (Admin)sqlMapClient.queryForObject("master.getAdmin");
		return admin;
	}
	
	public int update(Admin admin) throws SQLException{
		sqlMapClient.update("master.update", admin);
		return 1;
	}

}
