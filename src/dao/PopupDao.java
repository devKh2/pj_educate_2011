package dao;

import java.sql.SQLException;
import java.util.List;

import model.Popup;

public interface PopupDao {
	public int selectCount(String search) throws SQLException;
	
	public List<Popup> select(int firstRow, int endRow, String search) throws SQLException;
	
	public int insertPopup(Popup popup) throws SQLException;
	
	public int deletePopup(int pop_artid) throws SQLException;
	
	public int updatePopup() throws SQLException;
	
	public int getCountExePopupList(String search) throws SQLException;
	
	public List<Popup> getExePopupList(String search) throws SQLException;
	
	public Popup prisentPopup1() throws SQLException;
	
	public Popup prisentPopup2() throws SQLException;
	
	public boolean isExist(Popup popup) throws SQLException;
}
