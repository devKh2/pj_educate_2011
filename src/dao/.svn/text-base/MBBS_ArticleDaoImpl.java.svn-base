package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.MBBS_Article;
import model.SearchParam;
import model.StoreModel;

import org.apache.log4j.Logger;

import service.IdGenerationFailedException;

import com.ibatis.sqlmap.client.SqlMapClient;



public class MBBS_ArticleDaoImpl implements MBBS_ArticleDao{
	
	static Logger logger = Logger.getLogger(MBBS_ArticleDaoImpl.class);
	private SqlMapClient sqlMapClient;
	
	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}
	//------------------------------------------------------------------------------
	public int selectCount(String searchkind, String search) throws SQLException {
		
		Map<String,String> params = new HashMap<String,String>();
		params.put("searchkind", searchkind);
		params.put("search", search);
		
		return (Integer)(sqlMapClient.queryForObject("mbbs.count",params));
	}
	
	//------------------------------------------------------------------------------
	@SuppressWarnings("unchecked")
	public List<MBBS_Article> select(int firstRow,int endRow,String searchkind, String search)
	throws SQLException {
		
		Map<String,String> params = new HashMap<String,String>();
		
		params.put("firstRow",String.valueOf(firstRow));
		params.put("endRow", String.valueOf(endRow));
		params.put("searchkind", searchkind);
		params.put("search", search);
		
		
		return sqlMapClient.queryForList("mbbs.list", params);
	}
	//------------------------------------------------------------------------------
	
	/**
	 * 검색 엔진을 통해 검색 했을 때, 검색된 결과 게시판 개수 가져오기
	 */
	public int selectCount_search(String keyWord)throws SQLException {
		int articleCount = (Integer) sqlMapClient.queryForObject("mbbs.search_count", keyWord);
		return articleCount;
	}
	
	
	/**
	 * 검색 엔진을 통해 검색 했을 때, 검색된 결과 게시판 list를  가져오기.
	 */
	public List<MBBS_Article> selectSearSort(int firstRow, int endRow, SearchParam searParam) throws SQLException{
		List<MBBS_Article> sList = null ;
		Map<String, String> params = new HashMap<String, String>();
		params.put("firstRow", Integer.toString(firstRow));
		params.put("endRow", Integer.toString(endRow));
		params.put("keyWord", searParam.getKw());
		
		return (List<MBBS_Article>) sqlMapClient.queryForList("mbbs.search_list", params);
	}
	
	
	public int generateNextId(String sequenceName) throws IdGenerationFailedException ,SQLException{
		int id=-1;
		try {
			id = (Integer)sqlMapClient.queryForObject("mbbs.selectIdSequence",sequenceName);
			id++;
			
			Map<String,String> params = new HashMap<String,String>();
			params.put("id",String.valueOf(id));
			params.put("sequenceName",sequenceName);
			
			sqlMapClient.update("mbbs.updateIdSequence",params);
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
			return id;
	}
	
	//------------------------------------------------------------------------------
	public int insert( MBBS_Article mbbs_Article) throws SQLException {
		if(mbbs_Article.getMbbs_picnum().equals("0")){
			mbbs_Article.setMbbs_picnum("1");
		}
		int rtn =(Integer)sqlMapClient.insert("mbbs.insertArticle",mbbs_Article);
		return rtn;
	}
	//------------------------------------------------------------------------------
	public MBBS_Article selectById( int artId)throws SQLException {
		try {
			MBBS_Article article = (MBBS_Article)sqlMapClient.queryForObject("mbbs.selectById", artId);
			return article;
		} catch (SQLException sqle){
			sqle.printStackTrace();
			throw sqle;
		}
	}
	//------------------------------------------------------------------------------

	public void increaseReadCount(int mbbs_artid)
	throws SQLException {

		try {
			sqlMapClient.update("mbbs.increaseReadCount", mbbs_artid);
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
		
		return (String)sqlMapClient.queryForObject("mbbs.selectLastSequenceNumber", params);
	
	}
	//------------------------------------------------------------------------------

	public int update(MBBS_Article article) throws SQLException {
		return sqlMapClient.update("mbbs.updateArticle", article);
	}
	//------------------------------------------------------------------------------

	public void delete( int artId) throws SQLException {
		sqlMapClient.delete("mbbs.deleteArticle",artId);
	}
	 public ArrayList<MBBS_Article> random_3_List() throws SQLException{
		  return (ArrayList<MBBS_Article>) sqlMapClient.queryForList("mbbs.random3_mbbs_list");
	}
	
}
