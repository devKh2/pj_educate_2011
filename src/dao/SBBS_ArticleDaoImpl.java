package dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.MBBS_Article;
import model.SBBS_Article;

import org.apache.log4j.Logger;

import service.IdGenerationFailedException;

import com.ibatis.sqlmap.client.SqlMapClient;



public class SBBS_ArticleDaoImpl implements SBBS_ArticleDao{
	
	static Logger logger = Logger.getLogger(SBBS_ArticleDaoImpl.class);
	private SqlMapClient sqlMapClient;
	
	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}
	//------------------------------------------------------------------------------
	public int selectCount(String searchkind, String search,String stnum) throws SQLException {
		
		Map<String,String> params = new HashMap<String,String>();
		if(searchkind!=null && search!=null){
			params.put("searchkind", searchkind);
			params.put("search", search);
		}
		params.put("stnum", stnum);
		return (Integer)(sqlMapClient.queryForObject("sbbs.count",params));
	}
	
	//------------------------------------------------------------------------------
	@SuppressWarnings("unchecked")
	public List<SBBS_Article> select(int firstRow,int endRow,String searchkind, String search, String stnum)
	throws SQLException {
		Map<String,String> params = new HashMap<String,String>();
		params.put("firstRow",String.valueOf(firstRow));
		params.put("endRow", String.valueOf(endRow));
		params.put("searchkind", searchkind);
		params.put("search", search);
		params.put("stnum", stnum);
		return sqlMapClient.queryForList("sbbs.list", params);
	}
	//------------------------------------------------------------------------------
	
	public int generateNextId(String sequenceName) throws IdGenerationFailedException ,SQLException{
		int id=-1;
		try {
			id = (Integer)sqlMapClient.queryForObject("sbbs.selectIdSequence",sequenceName);
			id++;
			
			Map<String,String> params = new HashMap<String,String>();
			params.put("id",String.valueOf(id));
			params.put("sequenceName",sequenceName);
			
			sqlMapClient.update("sbbs.updateIdSequence",params);
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
			return id;
	}
	
	//------------------------------------------------------------------------------
	public int insert( SBBS_Article sbbs_Article) throws SQLException {
		int rtn =(Integer)sqlMapClient.insert("sbbs.insertArticle",sbbs_Article);
		return rtn;
	}
	//------------------------------------------------------------------------------
	public SBBS_Article selectById( int artId)throws SQLException {
		try {
			SBBS_Article article = (SBBS_Article)sqlMapClient.queryForObject("sbbs.selectById", artId);
			return article;
		} catch (SQLException sqle){
			sqle.printStackTrace();
			throw sqle;
		}
	}
	//------------------------------------------------------------------------------

	public void increaseReadCount(int sbbs_artid)
	throws SQLException {

		try {
			sqlMapClient.update("sbbs.increaseReadCount", sbbs_artid);
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
		
		return (String)sqlMapClient.queryForObject("sbbs.selectLastSequenceNumber", params);
	
	}
	//------------------------------------------------------------------------------

	public int update(SBBS_Article article) throws SQLException {
		return sqlMapClient.update("sbbs.updateArticle", article);
	}
	//------------------------------------------------------------------------------

	public void delete( int artId) throws SQLException {
		sqlMapClient.delete("sbbs.deleteArticle",artId);
	}
	
	
}
