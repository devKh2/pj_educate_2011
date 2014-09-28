package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.MenuModel;
import model.SearchParam;
import model.StoreModel;

public interface MenuDao {
	//메뉴 한가지의 정보를 받아온다.
	MenuModel getMenu(String menunum,String stnum) throws SQLException;
	
	//getRandomMenuList  
	public ArrayList<MenuModel> getRandomMenu() throws SQLException ;
	//getTopMenuList
	public ArrayList<MenuModel> getTopMenu() throws SQLException ;
	
	//메뉴의 총 갯수를 가져 온다.
	int getMenuCount() throws SQLException;
	
	//메뉴 리스트 한 페이지에 뿌려줄 값을 가져 온다.
	List<MenuModel> getMenuSelect(int firstRow, int endRow) throws SQLException;
	
	//getMenuModelList 검색 조건에 맞는 컬럼 갯수를 가져온다.
	public int selectCount(String keyWord)throws SQLException; 
	
	//getMenuModelList 검색 조건에 맞는 메뉴 리스트를 가져온다.
	public List<MenuModel> select(int firstRow, int endRow, SearchParam searParam) throws SQLException;
	
	public List<MenuModel> select_v(int firstRow, int endRow, String keyWord) throws SQLException;
	
	//메뉴 정보에서 store 정보로 검색 하여 총 갯수를 가져 온다.
	public int selectCount_s(String keyWord)throws SQLException;
	
	public int selectCount_v(String keyWord)throws SQLException;
	
	
	
	//메뉴 정보에서 store 정보로 검색 하여 메뉴 리스트를 가져 온다.
	public List<MenuModel> select_s(int firstRow, int endRow, String keyWord) throws SQLException;
	
	//메뉴를 추가 한다.
	int insertMenu(MenuModel menu) throws SQLException;
	
	//메뉴를 삭제 한다.
	public int deleteMenu(String menu_name, String st_num) throws SQLException;
}
