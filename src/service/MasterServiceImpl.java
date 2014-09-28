package service;

import java.sql.SQLException;

import model.Admin;
import dao.AdminDao;

public class MasterServiceImpl implements MasterService {

	AdminDao adminDao;
	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}
	@Override
	public Admin getAdmin() throws SQLException {
		Admin admin = adminDao.getAdmin();
		return admin;
	}
	
	public int update(Admin admin) throws SQLException{
		adminDao.update(admin);
		return 1;
	}

}
