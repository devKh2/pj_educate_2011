package dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.NBBS_Article;

import org.apache.log4j.Logger;
import com.ibatis.sqlmap.client.SqlMapClient;



public class NBBS_ArticleDaoImpl implements NBBS_ArticleDao{
	
	static Logger logger = Logger.getLogger(NBBS_ArticleDaoImpl.class);
	private SqlMapClient sqlMapClient;
	
	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}
	//------------------------------------------------------------------------------
	public int selectCount(String searchkind, String search) throws SQLException {
		
		Map<String,String> params = new HashMap<String,String>();
		params.put("searchkind", searchkind);
		params.put("search", search);
		
		return (Integer)(sqlMapClient.queryForObject("nbbs.count",params));
	}
	
	//------------------------------------------------------------------------------
	@SuppressWarnings("unchecked")
	public List<NBBS_Article> select(int firstRow,int endRow,String searchkind, String search)
	throws SQLException {
		
		Map<String,String> params = new HashMap<String,String>();
		
		params.put("firstRow",String.valueOf(firstRow));
		params.put("endRow", String.valueOf(endRow));
		params.put("searchkind", searchkind);
		params.put("search", search);
		
		System.out.println("ArticleDaoImpe.select: firstRow = "+firstRow + " endRow = "+ endRow);
		System.out.println("ArticleDaoImpe.select: searchkind ="+searchkind+" search="+search);
		
		return sqlMapClient.queryForList("nbbs.list", params);
	}

	
	//------------------------------------------------------------------------------
	public int insert( NBBS_Article nbbs_Article) throws SQLException {
		int rtn =(Integer)sqlMapClient.insert("nbbs.insertArticle",nbbs_Article);
		return rtn;
	}
	//------------------------------------------------------------------------------
	public NBBS_Article selectById( int notice_artid)throws SQLException {
		try {
			NBBS_Article article = (NBBS_Article)sqlMapClient.queryForObject("nbbs.selectById", notice_artid);
			return article;
		} catch (SQLException sqle){
			sqle.printStackTrace();
			throw sqle;
		}
	}
	//------------------------------------------------------------------------------

	public void increaseReadCount(int nbbs_artid)
	throws SQLException {

		try {
			sqlMapClient.update("nbbs.increaseReadCount", nbbs_artid);
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
	}

	//------------------------------------------------------------------------------

	public int update(NBBS_Article article) throws SQLException {
		return sqlMapClient.update("nbbs.updateArticle", article);
	}
	//------------------------------------------------------------------------------

	public void delete( int artId) throws SQLException {
		sqlMapClient.delete("nbbs.deleteArticle",artId);
	}
	
	
}
