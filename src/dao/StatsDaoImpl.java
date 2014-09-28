package dao;

import java.sql.SQLException;
import java.util.List;
import org.apache.log4j.Logger;
import com.ibatis.sqlmap.client.SqlMapClient;
import controller.MasterSaleController;
import model.SaleDaySearch;
import model.DayOfStats_Total;



public class StatsDaoImpl implements StatsDao {
	
	static Logger logger = Logger.getLogger(MasterSaleController.class);

	private SqlMapClient sqlMapClient;

	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}
	
	public int selectCount(SaleDaySearch saleDaySearch) throws SQLException{
		System.out.println(saleDaySearch.getDate());
		return (Integer)(sqlMapClient.queryForObject("stats.count", saleDaySearch));
	}
	
	public List<DayOfStats_Total> select(SaleDaySearch saleDaySearch) throws SQLException{
		System.out.println(saleDaySearch.getDate());
		return (List<DayOfStats_Total>)sqlMapClient.queryForList("stats.list", saleDaySearch);
	}
	
	public int selecteachStoreCount(SaleDaySearch saleDaySearch) throws SQLException{
		return (Integer)(sqlMapClient.queryForObject("stats.eachStorelistcount", saleDaySearch));
	}
	public List<DayOfStats_Total> selecteachStore(SaleDaySearch saleDaySearch) throws SQLException{
		return (List<DayOfStats_Total>)sqlMapClient.queryForList("stats.eachStorelist", saleDaySearch);
	}
	
	public int selectYearCount(SaleDaySearch saleDaySearch) throws SQLException{
		return (Integer)(sqlMapClient.queryForObject("stats.yearCount", saleDaySearch));
	}
	public List<DayOfStats_Total> selectYear(SaleDaySearch saleDaySearch) throws SQLException{
		return (List<DayOfStats_Total>)sqlMapClient.queryForList("stats.yearList", saleDaySearch);
	}

	public int selectYearEachStoreCount(SaleDaySearch saleDaySearch) throws SQLException{
		return (Integer)(sqlMapClient.queryForObject("stats.yearEachStorelistcount", saleDaySearch));
	}
	
	// 0207과 같이 쓰는 Dao
	public List<DayOfStats_Total> selectYearEchStore(SaleDaySearch saleDaySearch) throws SQLException{
		return (List<DayOfStats_Total>)sqlMapClient.queryForList("stats.yearEachStorelist", saleDaySearch);
	}
}
