package service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import dao.StoreDao;
import model.DesignModel;
import model.MenuModel;
import model.SearchParam;
import model.StoreListModel;
import model.StoreModel;

public class StoreServiceImpl implements StoreService{
	
	static Logger logger = Logger.getLogger(StoreServiceImpl.class);
	
	StoreDao storeDao;
	public void setStoreDao(StoreDao storeDao) {
		this.storeDao = storeDao;
	}
	@Override
	public StoreModel getStore(int st_num) throws SQLException {
		return storeDao.getStore(st_num);
	}
	
	public int insertStore(StoreModel storeModel) throws SQLException{
		return storeDao.insertMenu(storeModel);
	}
	
	@Override
	public int countGuest(String st_num) throws SQLException {
		return storeDao.countGuest(st_num);
	}
	@Override
	public int setDesign(DesignModel dm) throws SQLException {
		return storeDao.setDesign(dm);
	}
	@Override
	public DesignModel getDesign(String st_num) throws SQLException {
		return storeDao.getDesign(st_num);
	}
	/**
	 * 검색 조건에 따른 가게 list가져오기.
	 * @param requestPageNumber
	 * @param keyWord
	 * @param searchMenuSect
	 * @param searchStoreSect
	 * @return 가게 list
	 */
	public StoreListModel getStoreModelList(SearchParam searParam){
		//검색된 row 수로 전체 결과 페이지 수 결정.
		int totalPageCount;
		int firstRow;
		int endRow;
		int totalStoreModelCount;
		
		if (searParam.getP() < 0) {
			throw new IllegalArgumentException("page number < 0 : "
					+ searParam.getP());
		}
		 
		try {
			if(searParam.getKw() != null){
				
				List<StoreModel> storeModelList;
				//검색창에서 통합검색으로 검색했을 때 가게  row count.
				totalStoreModelCount = storeDao.selectCount(searParam.getKw());
				if (totalStoreModelCount == 0) {
					return new StoreListModel();
				}
				
				if(searParam.getDetail() != null){
					// 검색 상세 결과 페이지 --
					//검색된 row 수로 전체 결과 페이지 수 결정.(각 페이지당 10개 row) 
					totalPageCount = calculateTotalPageCount(totalStoreModelCount, searParam.getPage_per_count());
					
					//통합검색 후 음식점 더보기 클릭 했을 때, 한페이지당 시작과 끝 로우 결정. ( 10개 )
					firstRow = calculateFirstRow(searParam.getP(), searParam.getPage_per_count());
					endRow = calculateEndRow(firstRow, searParam.getPage_per_count(), totalStoreModelCount);
					storeModelList = storeDao.selectSearSort(firstRow, endRow, searParam);
				}else{
					//검색된 row 수로 전체 결과 페이지 수 결정.(각 페이지당 5개 row) 
					totalPageCount = calculateTotalPageCount(totalStoreModelCount, 5);
					
					//통합검색 후 section 당 로우 개수(5 개)로 시작과 끝 로우 결정. 
					firstRow = calculateFirstRow(searParam.getP(), 5);
					endRow = calculateEndRow(firstRow, 5, totalStoreModelCount);
					storeModelList = storeDao.select(firstRow, endRow, searParam);
				}

				
				

				StoreListModel storeListView = new StoreListModel(
						storeModelList, searParam.getP(), totalPageCount, firstRow,
						endRow, totalStoreModelCount, searParam.getPage_per_count());
				return storeListView;
			}else{
				// 메인화면에서 메뉴바를 통한 검색 창
				
				if(searParam.getMenu_sect() != null){
					// 메인화면에서 음식별 메뉴바 검색 시 가게 row count.
					totalStoreModelCount = storeDao.selectCountMe(searParam.getMenu_sect());
				}else{
					// 메인화면에서 업종별 메뉴바 검색 시 가게  row count.
					totalStoreModelCount = storeDao.selectCountSt(searParam.getSt_type());
				}

				if (totalStoreModelCount == 0) {
					return new StoreListModel();
				}
				
				if(searParam.getDetail() != null){
					// 통합 검색 상세 결과 페이지 --
					//검색된 row 수로 전체 결과 페이지 수 결정.(각 페이지당 10개 row) 
					totalPageCount = calculateTotalPageCount(totalStoreModelCount, searParam.getPage_per_count());
					
					//통합검색 후 음식점 더보기 클릭 했을 때, 한페이지당 시작과 끝 로우 결정. ( 10개 )
					firstRow = calculateFirstRow(searParam.getP(), searParam.getPage_per_count());
					endRow = calculateEndRow(firstRow, searParam.getPage_per_count(), totalStoreModelCount);
				}else{
					// 통합 검색 심플 결과 페이지 --
					//검색된 row 수로 전체 결과 페이지 수 결정.(각 페이지당 5개 row) 
					totalPageCount = calculateTotalPageCount(totalStoreModelCount, 5);
					
					//통합검색 후 section 당 로우 개수(5 개)로 시작과 끝 로우 결정. 
					firstRow = calculateFirstRow(searParam.getP(), 5);
					endRow = calculateEndRow(firstRow, 5, totalStoreModelCount);
				}
				
				if (endRow > totalStoreModelCount) {
					endRow = totalStoreModelCount;
				}
				
				List<StoreModel> storeModelList;
				
				if(searParam.getMenu_sect() != null){
					// 메인화면에서 음식별 메뉴바로 검색 시 가게 리스트 가져옴.
					storeModelList = storeDao.selectMe(firstRow, endRow, searParam);
				}else{
					// 메인화면에서 업종별 메뉴바로 검색 시 가게 리스트 가져옴.
					storeModelList = storeDao.selectSt(firstRow, endRow, searParam);
				}
				
				StoreListModel storeListView = new StoreListModel(
						storeModelList, searParam.getP(), totalPageCount, firstRow,
						endRow, totalStoreModelCount, searParam.getPage_per_count());
				return storeListView;

			}
			
		} catch (SQLException e) {
			throw new RuntimeException("DB 에러 발생:" + e.getMessage(), e);
		} finally {
		}
		
	}

	@Override
	public ArrayList<MenuModel> getStoreMenu(int st_num) throws SQLException {
		return storeDao.getStoreMenu(st_num);
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
	 * 결과에 따른 전체 페이지 개수 계산
	 * @param totalMenuCount
	 * @param count_per_page
	 * @return 전체 페이지 개수 
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
	public int deleteStore(String st_num) throws SQLException {
		storeDao.deleteStore(st_num);
		return 0;
	}
	
	/**
	 * 메인화면 - 배달가 소식 : 배달맛집 랜덤으로 가져오기
	 */
	public ArrayList<StoreModel> getRandomStoreList() throws SQLException {
		return storeDao.getRandomStore();
	}
	
	
	public ArrayList<StoreModel> getTopStoreList() throws SQLException {
		return storeDao.getTopStore();
	}

}
