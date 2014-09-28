package service;

import java.sql.SQLException;
import java.util.List;
import org.apache.log4j.Logger;
import dao.PopupDao;
import model.Popup;
import model.PopupListModel;


public class PopupServiceImpl implements PopupService {
	static Logger logger = Logger.getLogger(PopupServiceImpl.class);

	private PopupDao popupDao;
	
	public void setPopupDao(PopupDao popupDao) {
		this.popupDao = popupDao;
	}


	public PopupListModel getPopupList(int requestPageNumber, String search){
		
		if (requestPageNumber < 0) { // 요청한 페이지가 0보다 작으면
			throw new IllegalArgumentException("page number < 0 : "
					+ requestPageNumber); // 페이지 에러
		}
		
		try {

			int totalArticleCount = popupDao.selectCount(search); // 게시판글// 객수// 리턴함// ::// totalArticleCount// =// 3
			logger.debug("totalArticleCount= " + totalArticleCount);

			if (totalArticleCount == 0) { // 게시판 글 수가 0이면
				return new PopupListModel(); // ArticleListModel객체 를 리턴하고
			}

			int totalPageCount = calculateTotalPageCount(totalArticleCount); // totalpageCount// =// 1

			int firstRow = (requestPageNumber - 1) * COUNT_PER_PAGE + 1; // firstRow=([1] -1)*10+1=>1
			int endRow = firstRow + COUNT_PER_PAGE - 1; // endRow = 1 + 10 -1 =>10

			if (endRow > totalArticleCount) { // 마지막 row가 게시판 글 갯수보다 크면
				endRow = totalArticleCount; // 게시판 글 갯수가 마지막 row가 된다.
			}

			logger.debug("firstRow = " + firstRow);
			logger.debug("endRow = " + endRow);

			List<Popup> popupList = null;
			PopupListModel popupListView = null;

			System.out.println("articleDao.select문을 실행하기 위해 준비");
			popupList = popupDao.select(firstRow, endRow, search); // articleDao의 전체 글 검색하는 쿼리 실행( 첫 로우 1, 마지막로우10)
			popupListView = new PopupListModel(popupList, requestPageNumber, totalPageCount, firstRow, endRow);

			popupListView.setTotalArticleCount(totalArticleCount); // 총 페이지 수는 3

			return popupListView;

		} catch (SQLException e) {
			throw new RuntimeException("DB 에러 발생:" + e.getMessage(), e);
		} finally {

		}
	}
		
	private int calculateTotalPageCount(int totalArticleCount) {
		if (totalArticleCount == 0) {
			return 0;
		}
		int pageCount = totalArticleCount / COUNT_PER_PAGE; // 총 페이지 수에서 10을 나눈 것을 pageCount에 저장함
															// : 3/10 = 0   pageCount는 0
		if (totalArticleCount % COUNT_PER_PAGE > 0) { // 만약 총페이지 수 에서 10을 나눈것의나머지가 0보다 크면 
														// : 3%10 = 3
			pageCount++; // pageCount를 1 증가시킴 : pageCount는 1
		}
		return pageCount;
	}
	
	//팝업 인서트 메서드
	public int insertPopup(Popup popup){
		
		int result;
		try {
			result = popupDao.insertPopup(popup);
			return result;
		} catch (SQLException e) {
			throw new RuntimeException("DB 에러 발생:" + e.getMessage(), e);
		}
	}
	
	
	//팝업 삭제
	public int deletePopup(int pop_artid){
		int result;
		try {
			result = popupDao.deletePopup(pop_artid);
			return result;
		} catch (SQLException e) {
			throw new RuntimeException("DB 에러 발생:" + e.getMessage(), e);
		}
	}
	
	public int updatePopupList() throws Exception{
		
		System.out.println("PopupServiceImpl의 updatePopupList()실행1" );
		
		try {
			popupDao.updatePopup();
			System.out.println("PopupServiceImpl의 updatePopupList()실행2" );

			System.out.println("PopupServiceImpl의 updatePopupList()실행3" );
			return 1;
			
		} catch (SQLException e) {
			throw new RuntimeException("DB 에러 발생:" + e.getMessage(), e);
		}
	}
	
	
	public int getCountExePopupList(String search) throws SQLException{
		return popupDao.getCountExePopupList(search);
	}
	
	public PopupListModel getExePopupList(String search) throws SQLException{
		List<Popup> popupList = null;
		PopupListModel popupListView = null;

		System.out.println("articleDao.select문을 실행하기 위해 준비");
		popupList = popupDao.getExePopupList(search); // articleDao의 전체 글 검색하는 쿼리 실행( 첫 로우 1, 마지막로우10)
		popupListView = new PopupListModel(popupList);
		return popupListView;
	}
	
	public Popup prisentPopup1() throws SQLException{
		Popup popup1 = popupDao.prisentPopup1();
		return popup1;
	}
	
	public Popup prisentPopup2() throws SQLException{
		Popup popup2 = popupDao.prisentPopup2();
		return popup2;
	}

	public boolean isExist(Popup popup) throws SQLException{
		boolean rtn = false;
		
		rtn = popupDao.isExist(popup);
		return rtn;
	}
}
