package service;

import java.sql.SQLException;

import model.Banner;
import model.BannerListModel;
import model.Popup;

public interface BannerService {

	public static final int COUNT_PER_PAGE = 5;
	
	public BannerListModel getBannerList(int requestPageNumber, String search);
	
	public int insertBanner(Banner banner);
	
	public boolean isExist(Banner banner) throws SQLException;
	
	public int updateBannerList();
	
	public Banner presentBanner1() throws SQLException;
	
	public Banner presentBanner2() throws SQLException;
}
