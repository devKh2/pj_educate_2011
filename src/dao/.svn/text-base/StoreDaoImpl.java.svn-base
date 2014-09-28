package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import com.ibatis.sqlmap.client.SqlMapClient;

import model.DesignModel;
import model.MenuModel;
import model.SearchParam;
import model.StoreModel;

public class StoreDaoImpl implements StoreDao{

	SqlMapClient sqlMapClient;
	
	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}
	@Override
	public StoreModel getStore(int id) throws SQLException {
		return (StoreModel)sqlMapClient.queryForObject("store.getStoreOne",id);
	}
	@Override
	public ArrayList<MenuModel> getStoreMenu(int id) throws SQLException {
		return (ArrayList<MenuModel>)sqlMapClient.queryForList("store.getMenuList",id);
	}
	
	@Override
	public DesignModel getDesign(String st_num) throws SQLException {
		DesignModel model =new DesignModel();
		model=(DesignModel)sqlMapClient.queryForObject("store.getdesign",st_num);
		model.setIntroduction_img_path((String)sqlMapClient.queryForObject("store.getPicpath",model.getIntroduction_img()));
		model.setLeft_top_logo_path((String)sqlMapClient.queryForObject("store.getPicpath",model.getLeft_top_logo()));
		model.setMain_top_logo_path((String)sqlMapClient.queryForObject("store.getPicpath",model.getMain_top_logo()));
		return model;
	}
	
	@Override
	public int countGuest(String st_num) throws SQLException {
		sqlMapClient.update("store.addGuestCount",st_num);
		return (Integer)sqlMapClient.queryForObject("store.getGuestCount",st_num);
	}
	@Override
	public int setDesign(DesignModel dm) throws SQLException {
		Map<String, String> params =new HashMap<String, String>();

		//path 셋팅후 호출해야함.
		params.put("seq", String.valueOf(dm.getSeq()));
		params.put("left_top_logo",String.valueOf(dm.getLeft_top_logo()));
		params.put("main_top_logo",String.valueOf(dm.getMain_top_logo()));
		params.put("introduction_img",String.valueOf(dm.getIntroduction_img()));
		params.put("layout_color", dm.getLayout_color());
		params.put("bgcolor", dm.getBgcolor());
		sqlMapClient.update("store.modifyDesign",params);
		return 0;
	}
	
	/**
	 * 검색 엔진을 통해 검색 했을 때, 검색된 결과 가게 개수 가져오기
	 */
	public int selectCount(String keyWord)throws SQLException {
		int storeCount = (Integer) sqlMapClient.queryForObject("store.storeCount_s", keyWord);
	
		return storeCount;
	}
	
	/**
	 * 검색 메뉴바에서 메뉴별로 검색 했을 때, 검색된 결과 가게 개수 가져오기
	 */
	public int selectCountMe(String searchMenuSect) throws SQLException{
		int storeCount = (Integer) sqlMapClient.queryForObject("store.storeCount_s_m", searchMenuSect);
		return storeCount;
	}
	
	/**
	 * 검색 메뉴바에서 업종별로 검색 했을 때, 검색된 결과 가게 개수 가져오기
	 */
	public int selectCountSt(String searchStoreSect)throws SQLException{
		int storeCount = (Integer) sqlMapClient.queryForObject("store.storeCount_s_s", searchStoreSect);
		return storeCount;
	}
	
	/**
	 * 검색 엔진을 통해 검색 했을 때, 검색된 결과 가게 list 가져오기
	 */
	public List<StoreModel> select(int firstRow, int endRow, SearchParam searParam) throws SQLException {
		Map<String, String> params = new HashMap<String, String>();
		params.put("firstRow", Integer.toString(firstRow));
		params.put("endRow", Integer.toString(endRow));
		params.put("searchStoreValue", searParam.getKw());
		return (List<StoreModel>) sqlMapClient.queryForList("store.storelist_s", params);
	}
	
	/**
	 * 검색 엔진을 통해 검색 했을 때, 검색된 결과 가게 list를 판매순 정렬 순으로 가져오기
	 */
	public List<StoreModel> selectSearSort(int firstRow, int endRow, SearchParam searParam) throws SQLException{
		List<StoreModel> sList = null ;
		Map<String, String> params = new HashMap<String, String>();
		params.put("firstRow", Integer.toString(firstRow));
		params.put("endRow", Integer.toString(endRow));
		params.put("searchStoreValue", searParam.getKw());
		params.put("search_type", "st_name");
		if("sale".equals(searParam.getSort_method())){
			sList =  (List<StoreModel>) sqlMapClient.queryForList("store.storelist_s_sal", params);
		}else{
			params.put("sort_type", searParam.getSort_method());
			sList  = (List<StoreModel>) sqlMapClient.queryForList("store.storelist_s", params);
		}
		return sList;
	}
	
	/**
	 * 검색 메뉴바에서 메뉴별로 검색 했을 때, 검색된 결과 가게 list 가져오기
	 */
	public List<StoreModel> selectMe(int firstRow, int endRow, SearchParam searParam)throws SQLException{
		List<StoreModel> sList = null ;
		Map<String, String> params = new HashMap<String, String>();
		params.put("firstRow", Integer.toString(firstRow));
		params.put("endRow", Integer.toString(endRow));
		params.put("searchStoreValue", searParam.getMenu_sect());
		params.put("search_type", "menu_sect");
		if("sale".equals(searParam.getSort_method())){
			//검색 결과를 판매순으로 리스트 가져오기 
			sList =  (List<StoreModel>) sqlMapClient.queryForList("store.storelist_s_sal", params);
		}else{
			//검색 결과를 기본값 default 로 리스트 가져오기
			params.put("sort_type", searParam.getSort_method());
			sList  = (List<StoreModel>) sqlMapClient.queryForList("store.storelist_s_m", params);
		}
		return sList;
	}
	
	/**
	 * 검색 메뉴바에서 업종별로  검색 했을 때, 검색된 결과 list 가져오기
	 */
	public List<StoreModel> selectSt(int firstRow, int endRow, SearchParam searParam)throws SQLException{
		List<StoreModel> sList = null ;
		Map<String, String> params = new HashMap<String, String>();
		params.put("firstRow", Integer.toString(firstRow));
		params.put("endRow", Integer.toString(endRow));
		params.put("searchStoreValue", searParam.getSt_type());
		params.put("search_type", "st_type");
		if("sale".equals(searParam.getSort_method())){
			//검색 결과를 판매순으로 리스트 가져오기 
			sList =  (List<StoreModel>) sqlMapClient.queryForList("store.storelist_s_sal", params);
		}else{
			//검색 결과를 기본값 default 로 리스트 가져오기
			params.put("sort_type", searParam.getSort_method());
			sList  = (List<StoreModel>) sqlMapClient.queryForList("store.storelist_s_s", params);
		}
		return sList;
	}
	@Override
	public int insertMenu(StoreModel store) throws SQLException {
		int i=(Integer)sqlMapClient.queryForObject("store.getStoreMaxNum");
		sqlMapClient.update("store.upsert", store);
		sqlMapClient.insert("store.insertDesign",i+1);
		return 1;
	}
	@Override
	public int deleteStore(String st_num) throws SQLException {
		sqlMapClient.delete("store.delete", st_num);
		return 0;
	}
	@Override
	public ArrayList<StoreModel> getRandomStore() throws SQLException {
		
		return (ArrayList<StoreModel>)sqlMapClient.queryForList("store.getRandomStore");
	}
	@Override
	public ArrayList<StoreModel> getTopStore() throws SQLException {
		return (ArrayList<StoreModel>)sqlMapClient.queryForList("store.getTopStore");
	}
}
