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
			throw new RuntimeException("DB ���� �߻�:" + e.getMessage(), e);
		} finally {
		}

	}
	
	//�ش� ��ȣ �޴� ������
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
			throw new RuntimeException("DB ���� �߻�:" + e.getMessage(), e);
		} finally {
		}

	}


	/**
	 * �޴������� �˻� ��, �˻����ǿ� �´� �޴� ����Ʈ�� ������.
	 * @param searParam(p, kw, detail)
	 * @return �޴� ����Ʈ 
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
			
			//�˻��� row ���� ��ü ��� ������ �� ����.
			int totalPageCount;
			
			int firstRow;
			int endRow;
			
			if(searParam.getDetail() != null){
				//�˻��� row ���� ��ü ��� ������ �� ����.(�� �������� 10�� row) 
				totalPageCount = calculateTotalPageCount(totalMenuModelCount, 10);
				//���հ˻� �� ������ ������ Ŭ�� ���� ��, ���������� ���۰� �� �ο� ����. ( 10�� )
				firstRow = calculateFirstRow(searParam.getP(), 10);
				endRow = calculateEndRow(firstRow, 10, totalMenuModelCount);
			}else{
				//�˻��� row ���� ��ü ��� ������ �� ����.(�� �������� 5�� row) 
				totalPageCount = calculateTotalPageCount(totalMenuModelCount, 5);
				//���հ˻� �� section �� �ο� ����(5 ��)�� ���۰� �� �ο� ����. 
				firstRow = calculateFirstRow(searParam.getP(), 5);
				endRow = calculateEndRow(firstRow, 5, totalMenuModelCount);
			}

			List<MenuModel> menuModelList = menuDao.select(firstRow, endRow, searParam);

			MenuListModel menuListView = new MenuListModel(
					menuModelList, searParam.getP(), totalPageCount, firstRow,
					endRow, totalMenuModelCount, 10);
			
			return menuListView;
		} catch (SQLException e) {
			throw new RuntimeException("DB ���� �߻�:" + e.getMessage(), e);
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
	 * �˻� ������� ù��° row ���ϱ�.
	 * @param requestPageNumber
	 * @param count_per_page
	 * @return
	 */
	private int calculateFirstRow(int requestPageNumber, int count_per_page) {
		int firstRow = (requestPageNumber - 1) * count_per_page + 1;
		return firstRow;
	}
	
	/**
	 * �˻� �������  ������ row ���ϱ�.
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
	 * ���������� row ������ ��ü ������ �� ���ϱ�.
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
	 * ����ȭ�� - ��ް� �ҽ� : ��޿丮 �������� ��������
	 */
	public ArrayList<MenuModel> getRandomMenuList() throws SQLException {
		return menuDao.getRandomMenu();
	}


	@Override
	public ArrayList<MenuModel> getTopMenuList() throws SQLException {
		return menuDao.getTopMenu();
	}
}
