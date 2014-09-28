package service;

import java.sql.SQLException;
import java.util.List;

import model.Banner;
import model.BannerListModel;
import model.Popup;

import org.apache.log4j.Logger;
import dao.BannerDao;

public class BannerServiceImpl implements BannerService{

	static Logger logger = Logger.getLogger(BannerServiceImpl.class);

	private BannerDao bannerDao;

	public void setBannerDao(BannerDao bannerDao) {
		this.bannerDao = bannerDao;
	}

	public BannerListModel getBannerList(int requestPageNumber, String search){
		if (requestPageNumber < 0) { // 요청한 페이지가 0보다 작으면
			throw new IllegalArgumentException("page number < 0 : "
					+ requestPageNumber); // 페이지 에러
		}
		
		try {

			int totalBannerCount = bannerDao.selectCount(search); // 게시판글// 객수// 리턴함// ::// totalArticleCount// =// 3
			logger.debug("totalArticleCount= " + totalBannerCount);

			if (totalBannerCount == 0) { // 게시판 글 수가 0이면
				return new BannerListModel(); // ArticleListModel객체 를 리턴하고
			}

			int totalPageCount = calculateTotalPageCount(totalBannerCount); // totalpageCount// =// 1

			int firstRow = (requestPageNumber - 1) * COUNT_PER_PAGE + 1; // firstRow=([1] -1)*10+1=>1
			int endRow = firstRow + COUNT_PER_PAGE - 1; // endRow = 1 + 10 -1 =>10

			if (endRow > totalBannerCount) { // 마지막 row가 게시판 글 갯수보다 크면
				endRow = totalBannerCount; // 게시판 글 갯수가 마지막 row가 된다.
			}

			logger.debug("firstRow = " + firstRow);
			logger.debug("endRow = " + endRow);

			List<Banner> bannerList = null;
			BannerListModel bannerListView = null;

			System.out.println("articleDao.select문을 실행하기 위해 준비");
			bannerList = bannerDao.select(firstRow, endRow, search); // articleDao의 전체 글 검색하는 쿼리 실행( 첫 로우 1, 마지막로우10)
			bannerListView = new BannerListModel(bannerList, requestPageNumber, totalPageCount, firstRow, endRow);

			bannerListView.setTotalBannerCount(totalBannerCount); // 총 페이지 수는 3

			return bannerListView;

		} catch (SQLException e) {
			throw new RuntimeException("DB 에러 발생:" + e.getMessage(), e);
		} finally {
		}
	}
	
	private int calculateTotalPageCount(int totalBannerCount) {
		if (totalBannerCount == 0) {
			return 0;
		}
		int pageCount = totalBannerCount / COUNT_PER_PAGE; // 총 페이지 수에서 10을 나눈 것을 pageCount에 저장함
															// : 3/10 = 0   pageCount는 0
		if (totalBannerCount % COUNT_PER_PAGE > 0) { // 만약 총페이지 수 에서 10을 나눈것의나머지가 0보다 크면 
														// : 3%10 = 3
			pageCount++; // pageCount를 1 증가시킴 : pageCount는 1
		}
		return pageCount;
	}
	
	public int insertBanner(Banner banner){
		int result;
		try {
			result = bannerDao.insertBanner(banner);
			return result;
		} catch (SQLException e) {
			throw new RuntimeException("DB 에러 발생:" + e.getMessage(), e);
		}
	}
	public int updateBannerList(){
		try {
			bannerDao.updateBanner();
			return 1;	
		} catch (SQLException e) {
			throw new RuntimeException("DB 에러 발생:" + e.getMessage(), e);
		}
	}
	
	public Banner presentBanner1() throws SQLException{
		Banner banner1 = new Banner();
		banner1 = bannerDao.presentBanner1();
		return banner1;
	}
	public Banner presentBanner2() throws SQLException{
		Banner banner2 = new Banner();
		banner2 = bannerDao.presentBanner2();
		return banner2;
	}
	public boolean isExist(Banner banner) throws SQLException{
		boolean rtn = false;
		
		rtn = bannerDao.isExist(banner);
		return rtn;
	}
}
