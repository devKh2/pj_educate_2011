package service;

import java.sql.SQLException;
import java.util.ArrayList;

import model.DesignModel;
import model.MenuModel;
import model.SearchParam;
import model.StoreListModel;
import model.StoreModel;

public interface StoreService {
	public StoreModel getStore(int st_num) throws SQLException;
	public StoreListModel getStoreModelList(SearchParam searParam) throws SQLException;
	public ArrayList<StoreModel> getRandomStoreList() throws SQLException;
	public ArrayList<StoreModel> getTopStoreList() throws SQLException;
	public ArrayList<MenuModel> getStoreMenu(int st_num) throws SQLException;
	public int insertStore(StoreModel storeModel)throws SQLException;
	public int deleteStore(String st_num)throws SQLException;
	public DesignModel getDesign(String st_num)throws SQLException;
	public int setDesign(DesignModel dm)throws SQLException;
	public int countGuest(String st_num) throws SQLException;
}
