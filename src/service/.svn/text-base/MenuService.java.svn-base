package service;

import java.sql.SQLException;
import java.util.ArrayList;

import model.MenuListModel;
import model.MenuModel;
import model.SearchParam;

public interface MenuService {
	public static final int COUNT_PER_PAGE = 5;
	//하나의 메뉴의 정보를 받아 온다.
	public MenuModel getMenuOne(String menunum, String stnum)throws SQLException;
	//랜덤으로 메뉴(요리) 리스트 가져오기.
	public ArrayList<MenuModel> getRandomMenuList() throws SQLException;
	//메인의 top5 메뉴리스트 가져오기.
	public ArrayList<MenuModel> getTopMenuList() throws SQLException;
	//메뉴 이름을 키워드로 검색하여 리스트를 받아 온다.
	public MenuListModel getMenuModelList(SearchParam searParam) throws SQLException;
	
	//메뉴의 상호 이름을 키워드로 검색하여 리스트를 받아 온다.
	public MenuListModel getMenuModelList_s(int requestPageNumber, String keyWord) throws SQLException;
	
	//메뉴의 상호 이름을  검색하여  해당 가게의 메뉴리스트를 받아 온다.
	public MenuListModel getMenuModelList_v(int requestPageNumber, String keyWord) throws SQLException;
	
	//메뉴의 모든 리스트를 받아 온다.
	public MenuListModel getMenuList(int requestPageNumber) throws SQLException;
	
	//메뉴를 추가 한다.
	public int insertMenu(MenuModel menuModel) throws SQLException;
	
	//메뉴를 삭제 한다.
	public int deleteMenu(String menu_name, String st_num) throws SQLException;
}
