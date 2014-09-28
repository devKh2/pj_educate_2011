package service;

import java.sql.SQLException;

import model.Popup;
import model.PopupListModel;

public interface PopupService  {
	public static final int COUNT_PER_PAGE = 5;
	
	public PopupListModel getPopupList(int requestPageNumber, String search);
	
	public int insertPopup(Popup popup);
	
	public boolean isExist(Popup popup) throws SQLException;
	
	public int deletePopup(int pop_artid);
	
	public int updatePopupList() throws Exception;
	
	public int getCountExePopupList(String search) throws SQLException;
	
	public PopupListModel getExePopupList(String search) throws SQLException;
	
	public Popup prisentPopup1() throws SQLException;
	
	public Popup prisentPopup2() throws SQLException;
}
