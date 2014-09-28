package dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.Banner;
import model.Popup;

import org.apache.log4j.Logger;

import com.ibatis.sqlmap.client.SqlMapClient;

public class BannerDaoImpl implements BannerDao{
	
	static Logger logger = Logger.getLogger(BannerDaoImpl.class);
	private SqlMapClient sqlMapClient;

	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}
	
	public int selectCount(String search) throws SQLException{
		return (Integer)(sqlMapClient.queryForObject("banner.count"));
	}
	
	public List<Banner> select(int firstRow, int endRow, String search)throws SQLException{
		Map<String, String> params = new HashMap<String, String>();
		params.put("firstRow",  String.valueOf(firstRow));
		params.put("endRow",  String.valueOf(endRow));
		params.put("search", search);
		return (List<Banner>)sqlMapClient.queryForList("banner.list", params);
	}
	
	public int insertBanner(Banner banner) throws SQLException{
		return (Integer)sqlMapClient.insert("banner.insertBanner", banner);
	}
	
	public int updateBanner() throws SQLException{
		sqlMapClient.update("banner.ban_situationUpdate1");
		sqlMapClient.update("banner.ban_situationUpdate2");
		return sqlMapClient.update("banner.ban_situationUpdate3");
	}
	
	public Banner presentBanner1() throws SQLException{
		return (Banner) sqlMapClient.queryForObject("banner.presentBanner1");
	}
	
	public Banner presentBanner2() throws SQLException{
		return (Banner) sqlMapClient.queryForObject("banner.presentBanner2");
	}
	
	public boolean isExist(Banner banner) throws SQLException{

		int i,j;
		
		//배너테이블의 값이 모두 '완료'면 작성가능
		i = (Integer)sqlMapClient.queryForObject("banner.isEnd1");
		j = (Integer)sqlMapClient.queryForObject("banner.isEnd2");
		if( i == j){
			System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			System.out.println("i:  " + i + "  j:   " + j);
			return true;
		}
		
		//대기중인 게시글이 있는지 확인
		int k = (Integer)sqlMapClient.queryForObject("banner.isWait");
		if(k == 0){
			System.out.println("여기11111111111111111111111111");
			if((Integer)sqlMapClient.queryForObject("banner.isExist1", banner) != null){
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
			if((Integer)sqlMapClient.queryForObject("banner.isExist1", banner) == 0){
				res1 = 0;
			}
			System.out.println("22222222222222222222");
			if((Integer)sqlMapClient.queryForObject("banner.isExist2", banner) == 0){
				res2 = 0;
			}
			System.out.println("33333333333333333333");
			if((Integer)sqlMapClient.queryForObject("banner.isExist3", banner) == 0){
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
