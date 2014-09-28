package service;

import java.io.IOException;
import java.sql.SQLException;

import model.SaleDaySearch;
import model.StatsListModel;

public interface StatsService {

	public StatsListModel getList(SaleDaySearch saleDaySearch);	//���ϸ���
	public StatsListModel geteachStoreList(SaleDaySearch saleDaySearch); //���ϸ���
	
	public StatsListModel getYearList(SaleDaySearch saleDaySearch);	//���� ���� 
	
	public StatsListModel getEachYearStoreList(SaleDaySearch saleDaySearch); //����� ������ �������⸮��Ʈ
	
	//0207
	public String getStats_graph(String path, SaleDaySearch saleDaySearch) throws SQLException, IOException;  //�׷���

}
