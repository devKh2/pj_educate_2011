package dao;

import java.sql.SQLException;
import java.util.List;

import model.Banner;
import model.Popup;

public interface BannerDao {
	
	public int selectCount(String search) throws SQLException;
	
	public List<Banner> select(int firstRow, int endRow, String search)throws SQLException;

	public int insertBanner(Banner banner) throws SQLException;
	
	public int updateBanner() throws SQLException;
	
	public Banner presentBanner1() throws SQLException;
	
	public Banner presentBanner2() throws SQLException;
	
	public boolean isExist(Banner banner) throws SQLException;
}
