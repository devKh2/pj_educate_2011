package service;

import java.io.IOException;
import java.sql.SQLException;

import model.SaleDaySearch;
import model.StatsListModel;

public interface StatsService {

	public StatsListModel getList(SaleDaySearch saleDaySearch);	//일일매출
	public StatsListModel geteachStoreList(SaleDaySearch saleDaySearch); //일일매출
	
	public StatsListModel getYearList(SaleDaySearch saleDaySearch);	//월별 매출 
	
	public StatsListModel getEachYearStoreList(SaleDaySearch saleDaySearch); //어느한 가게의 월별매출리스트
	
	//0207
	public String getStats_graph(String path, SaleDaySearch saleDaySearch) throws SQLException, IOException;  //그래프

}
