package service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import dao.MenuDao;
import model.MenuListModel;
import model.MenuModel;
import model.SearchParam;

public class MenuServiceImpl implements MenuService{
	
	static Logger logger = Logger.getLogger(MenuServiceImpl.class);
	
	MenuDao menuDao;

	public void setMenuDao(MenuDao menuDao) {
		this.menuDao = menuDao;
	}

	
	public int insertMenu(MenuModel menuModel) throws SQLException{
		return menuDao.insertMenu(menuModel);
	}
	
	@Override
	public MenuModel getMenuOne(String menunum, String stnum) throws SQLException {
		return menuDao.getMenu(menunum, stnum);
	}

	public MenuListModel getMenuModelList_s(int requestPageNumber, String keyWord) throws SQLException{
		if (requestPageNumber < 0) {
			throw new IllegalArgumentException("page number < 0 : "
					+ requestPageNumber);
		}
		
		try {
			int totalMenuModelCount = menuDao.selectCount_s(keyWord);

			if (totalMenuModelCount == 0) {
				return new MenuListModel();
			}

			int totalPageCount = calculateTotalPageCount(totalMenuModelCount, 5);

			int firstRow = (requestPageNumber - 1) * COUNT_PER_PAGE + 1;
			int endRow = firstRow + COUNT_PER_PAGE - 1;

			if (endRow > totalMenuModelCount) {
				endRow = totalMenuModelCount;
			}

			List<MenuModel> menuModelList = menuDao.select_s(firstRow, endRow, keyWord);

			MenuListModel menuListView = new MenuListModel(
					menuModelList, requestPageNumber, totalPageCount, firstRow,
					endRow, totalMenuModelCount, 5);
			
			return menuListView;
		} catch (SQLException e) {
			throw new RuntimeException("DB 에러 발생:" + e.getMessage(), e);
		} finally {
		}

	}
	
	//해당 상호 메뉴 얻어오기
	@Override
	public MenuListModel getMenuModelList_v(int requestPageNumber,
			String keyWord) throws SQLException {
		if (requestPageNumber < 0) {
			throw new IllegalArgumentException("page number < 0 : "
					+ requestPageNumber);
		}
		
		try {
			int totalMenuModelCount = menuDao.selectCount_v(keyWord);

			if (totalMenuModelCount == 0) {
				return new MenuListModel();
			}

			int totalPageCount = calculateTotalPageCount(totalMenuModelCount, 5);

			int firstRow = (requestPageNumber - 1) * COUNT_PER_PAGE + 1;
			int endRow = firstRow + COUNT_PER_PAGE - 1;

			if (endRow > totalMenuModelCount) {
				endRow = totalMenuModelCount;
			}

			List<MenuModel> menuModelList = menuDao.select_v(firstRow, endRow, keyWord);

			MenuListModel menuListView = new MenuListModel(
					menuModelList, requestPageNumber, totalPageCount, firstRow,
					endRow, totalMenuModelCount, 5);
			
			return menuListView;
		} catch (SQLException e) {
			throw new RuntimeException("DB 에러 발생:" + e.getMessage(), e);
		} finally {
		}

	}


	/**
	 * 메뉴명으로 검색 시, 검색조건에 맞는 메뉴 리스트를 가져옴.
	 * @param searParam(p, kw, detail)
	 * @return 메뉴 리스트 
	 */
	public MenuListModel getMenuModelList(SearchParam searParam) throws SQLException{
		if (searParam.getP() < 0) {
			throw new IllegalArgumentException("page number < 0 : "
					+ searParam.getP());
		}
		
		try {
			int totalMenuModelCount = menuDao.selectCount(searParam.getKw());

			if (totalMenuModelCount == 0) {
				return new MenuListModel();
			}
			
			//검색된 row 수로 전체 결과 페이지 수 결정.
			int totalPageCount;
			
			int firstRow;
			int endRow;
			
			if(searParam.getDetail() != null){
				//검색된 row 수로 전체 결과 페이지 수 결정.(각 페이지당 10개 row) 
				totalPageCount = calculateTotalPageCount(totalMenuModelCount, 10);
				//통합검색 후 음식점 더보기 클릭 했을 때, 한페이지당 시작과 끝 로우 결정. ( 10개 )
				firstRow = calculateFirstRow(searParam.getP(), 10);
				endRow = calculateEndRow(firstRow, 10, totalMenuModelCount);
			}else{
				//검색된 row 수로 전체 결과 페이지 수 결정.(각 페이지당 5개 row) 
				totalPageCount = calculateTotalPageCount(totalMenuModelCount, 5);
				//통합검색 후 section 당 로우 개수(5 개)로 시작과 끝 로우 결정. 
				firstRow = calculateFirstRow(searParam.getP(), 5);
				endRow = calculateEndRow(firstRow, 5, totalMenuModelCount);
			}

			List<MenuModel> menuModelList = menuDao.select(firstRow, endRow, searParam);

			MenuListModel menuListView = new MenuListModel(
					menuModelList, searParam.getP(), totalPageCount, firstRow,
					endRow, totalMenuModelCount, 10);
			
			return menuListView;
		} catch (SQLException e) {
			throw new RuntimeException("DB 에러 발생:" + e.getMessage(), e);
		} finally {
		}
	}
	
	@Override
	public MenuListModel getMenuList(int requestPageNumber) throws SQLException {
		
		int totalMenuCount = menuDao.getMenuCount();
		
		if(totalMenuCount == 0){
			return new MenuListModel();
		}
		
		int totalPageCount = calculateTotalPageCount(totalMenuCount, 5);
		
		int firstRow = (requestPageNumber - 1) * COUNT_PER_PAGE + 1;
		int endRow = firstRow + COUNT_PER_PAGE - 1;
		
		if(endRow > totalMenuCount){
			endRow = totalMenuCount;
		}
		
		List<MenuModel> menuList = menuDao.getMenuSelect(firstRow, endRow);
		
		MenuListModel menuListModel = new MenuListModel(menuList, requestPageNumber, totalPageCount, firstRow, endRow, totalMenuCount, 10);
		return menuListModel;
	}
	
	
	/**
	 * 검색 결과에서 첫번째 row 구하기.
	 * @param requestPageNumber
	 * @param count_per_page
	 * @return
	 */
	private int calculateFirstRow(int requestPageNumber, int count_per_page) {
		int firstRow = (requestPageNumber - 1) * count_per_page + 1;
		return firstRow;
	}
	
	/**
	 * 검색 결과에서  마지막 row 구하기.
	 * @param firstRow
	 * @param count_per_page
	 * @param totalStoreModelCount
	 * @return
	 */
	private int calculateEndRow(int firstRow, int count_per_page, int totalStoreModelCount) {
		int endRow = firstRow + count_per_page - 1;
		
		if (endRow > totalStoreModelCount) {
			endRow = totalStoreModelCount;
		}
		return endRow;
	}
	
	/**
	 * 한페이지당 row 개수로 전체 페이지 수 구하기.
	 * @param totalMenuCount
	 * @param count_per_page
	 * @return
	 */
	private int calculateTotalPageCount(int totalMenuCount, int count_per_page) {
		if (totalMenuCount == 0) {
			return 0;
		}
		int pageCount = totalMenuCount / count_per_page;
		if (totalMenuCount % count_per_page > 0) {
			pageCount++;
		}
		return pageCount;
	}


	@Override
	public int deleteMenu(String menu_name, String st_num) throws SQLException {
		menuDao.deleteMenu(menu_name, st_num);
		return 0;
	}


	/**
	 * 메인화면 - 배달가 소식 : 배달요리 랜덤으로 가져오기
	 */
	public ArrayList<MenuModel> getRandomMenuList() throws SQLException {
		return menuDao.getRandomMenu();
	}


	@Override
	public ArrayList<MenuModel> getTopMenuList() throws SQLException {
		return menuDao.getTopMenu();
	}
}
