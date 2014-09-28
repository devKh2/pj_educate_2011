package dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;
import com.ibatis.sqlmap.client.SqlMapClient;

import model.Banner;
import model.Popup;

public class PopupDaoImpl implements PopupDao{
	
	static Logger logger = Logger.getLogger(PopupDaoImpl.class);
	private SqlMapClient sqlMapClient;

	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}
	
	public int selectCount(String search) throws SQLException{
		return (Integer)(sqlMapClient.queryForObject("popup.count"));

	}
	public List<Popup> select(int firstRow, int endRow, String search) throws SQLException{
		Map<String, String> params = new HashMap<String, String>();
		params.put("firstRow",  String.valueOf(firstRow));
		params.put("endRow",  String.valueOf(endRow));
		params.put("search", search);
		return (List<Popup>)sqlMapClient.queryForList("popup.list", params);
	}
	
	public int insertPopup(Popup popup) throws SQLException{
		return (Integer)sqlMapClient.insert("popup.insertPopup", popup);
	}
	
	public int deletePopup(int pop_artid) throws SQLException{
		sqlMapClient.delete("popup.deletePopup1", pop_artid);
		int result = sqlMapClient.delete("popup.deletePopup2", pop_artid);
		return result;
	}
	
	public int updatePopup() throws SQLException{
		System.out.println("PopupDaoImpl의  updatePopup()실행");
		sqlMapClient.update("popup.pop_situationUpdate1");
		sqlMapClient.update("popup.pop_situationUpdate2");
		return sqlMapClient.update("popup.pop_situationUpdate3");
	}
	
	public int getCountExePopupList(String search) throws SQLException{
		return (Integer)(sqlMapClient.queryForObject("popup.getCountExePopupList"));
	}
	
	public List<Popup> getExePopupList(String search) throws SQLException{
		Map<String, String> params = new HashMap<String, String>();
		params.put("search", search);
		return (List<Popup>)sqlMapClient.queryForList("popup.getExePopupList", params);
	}
	
	public Popup prisentPopup1() throws SQLException{
		return (Popup) sqlMapClient.queryForObject("popup.presentPopup1");
	}
		
	public Popup prisentPopup2() throws SQLException{
		return (Popup) sqlMapClient.queryForObject("popup.presentPopup2");
	}
	
	public boolean isExist(Popup popup) throws SQLException{
		int i,j;
		
		//배너테이블의 값이 모두 '완료'면 작성가능
		i = (Integer)sqlMapClient.queryForObject("popup.isEnd1");
		j = (Integer)sqlMapClient.queryForObject("popup.isEnd2");
		if( i == j){
			System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			System.out.println("i:  " + i + "  j:   " + j);
			return true;
		}
		
		//대기중인 게시글이 있는지 확인
		int k = (Integer)sqlMapClient.queryForObject("popup.isWait");
		if(k == 0){
			System.out.println("여기11111111111111111111111111");
			if((Integer)sqlMapClient.queryForObject("popup.isExist1", popup) != null){
				System.out.println("여기2222222222222222222222");
				return true;
			}
			else{
				System.out.println("여기33333333333333333");
				return false;
			}
		}else{
			int res1 = 1;
			int res2 = 1;
			int res3 = 1;
			int res4 = 1;
			
			System.out.println("11111111111111111");
			if((Integer)sqlMapClient.queryForObject("popup.isExist1", popup) == 0){
				res1 = 0;
			}
			System.out.println("22222222222222222222");
			if((Integer)sqlMapClient.queryForObject("popup.isExist2", popup) == 0){
				res2 = 0;
			}
			System.out.println("33333333333333333333");
			if((Integer)sqlMapClient.queryForObject("popup.isExist3", popup) == 0){
				res3 = 0;
			}
			/*
			if((Integer)sqlMapClient.queryForObject("banner.isWait2")!= 0){
				System.out.println("4444444444444444");
				if((Integer)sqlMapClient.queryForObject("banner.isExist4", banner) == 0){
					res4 = 0;
				}
			}
			*/
			
			System.out.println("res1:  " + res1 + "  res2:  " + res2 + "    res3:  " + res3  +"     res4:  " + res4 );
			boolean rtn1 = false;
			boolean rtn2 = false;
			
			if(res1 + res2 == 2){
				rtn1 = true;
			}
			if(res3 + res4 == 2){
				rtn2 = true;
			}
			
			boolean rtn3 = (rtn1 || rtn2);
			
			return rtn3;
		}
	}
}
