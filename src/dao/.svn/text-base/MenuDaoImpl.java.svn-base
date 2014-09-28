package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.MenuModel;
import model.SearchParam;

import com.ibatis.sqlmap.client.SqlMapClient;

public class MenuDaoImpl implements MenuDao {

	SqlMapClient sqlMapClient;

	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}

	@Override
	public MenuModel getMenu(String menunum, String stnum) throws SQLException {
		Map<String, String> params = new HashMap<String, String>();
		params.put("menunum", menunum);
		params.put("stnum", stnum);
		return (MenuModel) sqlMapClient.queryForObject("menu.one", params);
	}

	@Override
	public int getMenuCount() throws SQLException {
		return (Integer) sqlMapClient.queryForObject("menu.menuCount");
	}

	@Override
	public List<MenuModel> getMenuSelect(int firstRow, int endRow)
			throws SQLException {
		Map<String, Integer> params = new HashMap<String, Integer>();
		params.put("firstRow", firstRow);
		params.put("endRow", endRow);

		return sqlMapClient.queryForList("menu.menuSelect", params);
	}

	public int selectCount_s(String keyWord)throws SQLException{
		int menuCount = (Integer) sqlMapClient.queryForObject(
				"menu.menuCount_s_s", keyWord);
		return menuCount;
	}
	public int selectCount_v(String keyWord)throws SQLException{
		int menuCount = (Integer) sqlMapClient.queryForObject(
				"menu.menuCount_v", keyWord);
		return menuCount;
	}
	
	public List<MenuModel> select_s(int firstRow, int endRow, String keyWord) throws SQLException{
		Map<String, String> params = new HashMap<String, String>();
		params.put("firstRow", Integer.toString(firstRow));
		params.put("endRow", Integer.toString(endRow));
		params.put("keyWord", keyWord);
		return (List<MenuModel>) sqlMapClient.queryForList("menu.menulist_s_s",
				params);
	}
	public List<MenuModel> select_v(int firstRow, int endRow, String keyWord) throws SQLException{
		Map<String, String> params = new HashMap<String, String>();
		params.put("firstRow", Integer.toString(firstRow));
		params.put("endRow", Integer.toString(endRow));
		params.put("keyWord", keyWord);
		return (List<MenuModel>) sqlMapClient.queryForList("menu.menulist_v",
				params);
	}
	
	/**
	 * 검색 엔진을 통해 검색 했을 때, 검색된 결과 메뉴 개수 가져오기
	 */
	public int selectCount(String keyWord) throws SQLException {
		int menuCount = (Integer) sqlMapClient.queryForObject(
				"menu.menuCount_s", keyWord);
		return menuCount;
	}
	
	/**
	 * 검색 엔진을 통해 검색 했을 때, 검색된 결과 list 가져오기
	 */
	public List<MenuModel> select(int firstRow, int endRow, SearchParam searParam)
			throws SQLException {
		Map<String, String> params = new HashMap<String, String>();
		params.put("firstRow", Integer.toString(firstRow));
		params.put("endRow", Integer.toString(endRow));
		params.put("keyWord", searParam.getKw());
		params.put("sort_type", searParam.getSort_method());
		if("sale".equals(searParam.getSort_method()) || "visit".equals(searParam.getSort_method())){
			params.put("sort_type", searParam.getSort_method());
			return (List<MenuModel>) sqlMapClient.queryForList("menu.menulist_s",
					params);
		}else{
			return (List<MenuModel>) sqlMapClient.queryForList("menu.menulist_s",
				params);
		}
	}
	
	

	public int insertMenu(MenuModel menu) throws SQLException {
		sqlMapClient.update("menu.upsert", menu);
		sqlMapClient.update("menu.menuSeqIncrese", menu.getSt_num());
		return 1;
	}

	@Override
	public int deleteMenu(String menu_name, String st_num) throws SQLException {
		Map<String, String> params = new HashMap<String, String>();
		params.put("st_num", st_num);
		params.put("menu_name", menu_name);
		sqlMapClient.delete("menu.menuDelete", params);
		return 0;
	}

	@Override
	public ArrayList<MenuModel> getRandomMenu() throws SQLException {
		return (ArrayList<MenuModel>)sqlMapClient.queryForList("menu.getRandomMenu");
	}

	@Override
	public ArrayList<MenuModel> getTopMenu() throws SQLException {
		return (ArrayList<MenuModel>)sqlMapClient.queryForList("menu.getTopMenu");
	}

}
