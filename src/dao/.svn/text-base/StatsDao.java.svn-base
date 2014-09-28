package dao;

import java.sql.SQLException;
import java.util.List;
import model.SaleDaySearch;
import model.DayOfStats_Total;

public interface StatsDao {

	public int selectCount(SaleDaySearch saleDaySearch) throws SQLException;
	public List<DayOfStats_Total> select(SaleDaySearch saleDaySearch) throws SQLException;
	
	
	public int selecteachStoreCount(SaleDaySearch saleDaySearch) throws SQLException;
	public List<DayOfStats_Total> selecteachStore(SaleDaySearch saleDaySearch) throws SQLException;
	
	
	public int selectYearCount(SaleDaySearch saleDaySearch) throws SQLException;		//월별통게
	public List<DayOfStats_Total> selectYear(SaleDaySearch saleDaySearch) throws SQLException; //월별통계
	
	
	public int selectYearEachStoreCount(SaleDaySearch saleDaySearch) throws SQLException;
	public List<DayOfStats_Total> selectYearEchStore(SaleDaySearch saleDaySearch) throws SQLException;
	
}
