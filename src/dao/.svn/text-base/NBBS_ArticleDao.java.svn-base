package dao;

import java.sql.SQLException;
import java.util.List;

import model.NBBS_Article;

import service.IdGenerationFailedException;



public interface NBBS_ArticleDao {

	public int selectCount(String searchkind, String search) throws SQLException;
	
	public List<NBBS_Article> select(int firstRow,int endRow,String searchkind, String search) throws SQLException;
	
	public int insert( NBBS_Article nbbs_Article) throws SQLException;
	
	public NBBS_Article selectById( int artId)throws SQLException;
	
	public void increaseReadCount(int nbbs_artid)throws SQLException;
		
	public int update(NBBS_Article article) throws SQLException ;
	
	public void delete( int artId) throws SQLException;
	
}
