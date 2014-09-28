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
		if (requestPageNumber < 0) { // ��û�� �������� 0���� ������
			throw new IllegalArgumentException("page number < 0 : "
					+ requestPageNumber); // ������ ����
		}
		
		try {

			int totalBannerCount = bannerDao.selectCount(search); // �Խ��Ǳ�// ����// ������// ::// totalArticleCount// =// 3
			logger.debug("totalArticleCount= " + totalBannerCount);

			if (totalBannerCount == 0) { // �Խ��� �� ���� 0�̸�
				return new BannerListModel(); // ArticleListModel��ü �� �����ϰ�
			}

			int totalPageCount = calculateTotalPageCount(totalBannerCount); // totalpageCount// =// 1

			int firstRow = (requestPageNumber - 1) * COUNT_PER_PAGE + 1; // firstRow=([1] -1)*10+1=>1
			int endRow = firstRow + COUNT_PER_PAGE - 1; // endRow = 1 + 10 -1 =>10

			if (endRow > totalBannerCount) { // ������ row�� �Խ��� �� �������� ũ��
				endRow = totalBannerCount; // �Խ��� �� ������ ������ row�� �ȴ�.
			}

			logger.debug("firstRow = " + firstRow);
			logger.debug("endRow = " + endRow);

			List<Banner> bannerList = null;
			BannerListModel bannerListView = null;

			System.out.println("articleDao.select���� �����ϱ� ���� �غ�");
			bannerList = bannerDao.select(firstRow, endRow, search); // articleDao�� ��ü �� �˻��ϴ� ���� ����( ù �ο� 1, �������ο�10)
			bannerListView = new BannerListModel(bannerList, requestPageNumber, totalPageCount, firstRow, endRow);

			bannerListView.setTotalBannerCount(totalBannerCount); // �� ������ ���� 3

			return bannerListView;

		} catch (SQLException e) {
			throw new RuntimeException("DB ���� �߻�:" + e.getMessage(), e);
		} finally {
		}
	}
	
	private int calculateTotalPageCount(int totalBannerCount) {
		if (totalBannerCount == 0) {
			return 0;
		}
		int pageCount = totalBannerCount / COUNT_PER_PAGE; // �� ������ ������ 10�� ���� ���� pageCount�� ������
															// : 3/10 = 0   pageCount�� 0
		if (totalBannerCount % COUNT_PER_PAGE > 0) { // ���� �������� �� ���� 10�� �������ǳ������� 0���� ũ�� 
														// : 3%10 = 3
			pageCount++; // pageCount�� 1 ������Ŵ : pageCount�� 1
		}
		return pageCount;
	}
	
	public int insertBanner(Banner banner){
		int result;
		try {
			result = bannerDao.insertBanner(banner);
			return result;
		} catch (SQLException e) {
			throw new RuntimeException("DB ���� �߻�:" + e.getMessage(), e);
		}
	}
	public int updateBannerList(){
		try {
			bannerDao.updateBanner();
			return 1;	
		} catch (SQLException e) {
			throw new RuntimeException("DB ���� �߻�:" + e.getMessage(), e);
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
