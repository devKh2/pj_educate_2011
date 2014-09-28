package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.EBBS_Article;
import model.Random4_EBBS;

import org.apache.log4j.Logger;

import service.IdGenerationFailedException;

import com.ibatis.sqlmap.client.SqlMapClient;



public class EBBS_ArticleDaoImpl implements EBBS_ArticleDao{
	
	static Logger logger = Logger.getLogger(EBBS_ArticleDaoImpl.class);
	private SqlMapClient sqlMapClient;
	
	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}
	//------------------------------------------------------------------------------
	public int selectCount(int stnum) throws SQLException {
		System.out.println("dao impl"+stnum);
		int evaluationACount = (Integer)sqlMapClient.queryForObject("ebbs.count", stnum);
		return evaluationACount;
	}
	
	//------------------------------------------------------------------------------
	@SuppressWarnings("unchecked")
	public List<EBBS_Article> select(int firstRow, int endRow, int stnum)
	throws SQLException {
		Map<String,String> params = new HashMap<String,String>();
		params.put("firstRow", Integer.toString(firstRow));
		params.put("endRow", Integer.toString(endRow));
		params.put("stnum", Integer.toString(stnum));
		return sqlMapClient.queryForList("ebbs.list", params);
	}
	//------------------------------------------------------------------------------
	
	public int generateNextId(String sequenceName) throws IdGenerationFailedException ,SQLException{
		int id=-1;
		try {
			id = (Integer)sqlMapClient.queryForObject("ebbs.selectIdSequence",sequenceName);
			id++;
			
			Map<String,String> params = new HashMap<String,String>();
			params.put("id",String.valueOf(id));
			params.put("sequenceName",sequenceName);
			
			sqlMapClient.update("ebbs.updateIdSequence",params);
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
			return id;
	}
	
	//------------------------------------------------------------------------------
	public int insert( EBBS_Article ebbs_Article) throws SQLException {
		int rtn =(Integer)sqlMapClient.insert("ebbs.insertArticle",ebbs_Article);
		return rtn;
	}
	//------------------------------------------------------------------------------
	public EBBS_Article selectById( int artId)throws SQLException {
		try {
			EBBS_Article article = (EBBS_Article)sqlMapClient.queryForObject("ebbs.selectById", artId);
			return article;
		} catch (SQLException sqle){
			sqle.printStackTrace();
			throw sqle;
		}
	}
	//------------------------------------------------------------------------------

	public void increaseReadCount(int ebbs_artid)
	throws SQLException {

		try {
			sqlMapClient.update("ebbs.increaseReadCount", ebbs_artid);
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
	}
	//------------------------------------------------------------------------------

	public String selectLastSequenceNumber(String searchMaxSeqNum, String searchMinSeqNum) 
										throws SQLException {
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("searchMaxSeqNum", searchMaxSeqNum);
		params.put("searchMinSeqNum", searchMaxSeqNum);
		
		return (String)sqlMapClient.queryForObject("ebbs.selectLastSequenceNumber", params);
	
	}
	//------------------------------------------------------------------------------

	public int update(EBBS_Article article) throws SQLException {
		return sqlMapClient.update("ebbs.updateArticle", article);
	}
	//------------------------------------------------------------------------------

	public void delete( int artId) throws SQLException {
		sqlMapClient.delete("ebbs.deleteArticle",artId);
	}
	//------------------------------------------------------------------------------

	public int id_search(String user_id,int stnum)throws SQLException{
		Map<String,String> params=new HashMap<String, String>();
		params.put("user_id",user_id);
		params.put("st_num", String.valueOf(stnum));
		return (Integer)sqlMapClient.queryForObject("ebbs.id_search",params);
	}
	
	//------------------------------------------------------------------------------
	
	public ArrayList<Random4_EBBS> get_4list() throws SQLException{
		return (ArrayList<Random4_EBBS>) sqlMapClient.queryForList("ebbs.random_4_list");
	}
	
	
}
