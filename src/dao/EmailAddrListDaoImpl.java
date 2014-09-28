package dao;

import java.sql.SQLException;
import java.util.List;
import org.apache.log4j.Logger;
import com.ibatis.sqlmap.client.SqlMapClient;
import controller.MasterSaleController;
import model.EmailListModel;

public class EmailAddrListDaoImpl implements EmailAddrListDao{

	static Logger logger = Logger.getLogger(MasterSaleController.class);

	private SqlMapClient sqlMapClient;

	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}

	public List<EmailListModel> getCustomEmailAddr() throws SQLException{
		return (List<EmailListModel>)sqlMapClient.queryForList("email.getCustomAddrlist");
	}
	
	public List<EmailListModel> getStoreEmailAddr() throws SQLException{
		return (List<EmailListModel>)sqlMapClient.queryForList("email.getStoreAddrlist");
	}
}
