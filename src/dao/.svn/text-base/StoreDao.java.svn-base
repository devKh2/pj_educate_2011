package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.DesignModel;
import model.MenuModel;
import model.SearchParam;
import model.StoreModel;

public interface StoreDao {
	//getStore store의 기본 정보를 가저온다.
	public StoreModel getStore(int id) throws SQLException ;
	//getStoreMenu store의 메뉴 정보를 가저온다.
	public ArrayList<MenuModel> getStoreMenu(int id) throws SQLException ;
	//getRandomStoreList  
	public ArrayList<StoreModel> getRandomStore() throws SQLException ;
	//getTopStoreList
	public ArrayList<StoreModel> getTopStore() throws SQLException ;
	//getStoreModelList 검색 조건에 맞는 정보를 가져온다.
	public int selectCount(String keyWord)throws SQLException; 
	//getStoreModelList 검색 조건에 맞는 가게 리스트를 가져온다.
	public List<StoreModel> select(int firstRow, int endRow, SearchParam searParam) throws SQLException;
	//getStoreModelList 검색 조건과 정렬 조건에 맞는 가게 리스트를 가져온다.
	public List<StoreModel> selectSearSort(int firstRow, int endRow, SearchParam searParam) throws SQLException;
	//메인화면에서 메뉴별 메뉴바로 검색시 정보를 가져온다.
	public int selectCountMe(String searchMenuSect)throws SQLException;
	public List<StoreModel> selectMe(int firstRow, int endRow, SearchParam searParam)throws SQLException;
	//메인화면에서 업종별로 메뉴바로 검색시 정보를 가져온다.
	public int selectCountSt(String searchStoreSect)throws SQLException;
	public List<StoreModel> selectSt(int firstRow, int endRow, SearchParam searParam)throws SQLException;
	
	int insertMenu(StoreModel store) throws SQLException;
	public int deleteStore(String st_num)throws SQLException;
	public DesignModel getDesign(String st_num) throws SQLException;
	public int countGuest(String st_num) throws SQLException;
	public int setDesign(DesignModel dm) throws SQLException;
}
