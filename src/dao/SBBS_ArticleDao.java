package dao;

import java.sql.SQLException;
import java.util.List;

import service.IdGenerationFailedException;


import model.SBBS_Article;


public interface SBBS_ArticleDao {

	public int selectCount(String searchkind, String search,String stnum) throws SQLException;
	
	public List<SBBS_Article> select(int firstRow,int endRow,String searchkind, String search,String stnum) throws SQLException;
	
	public int generateNextId(String sequenceName) throws IdGenerationFailedException ,SQLException;
	
	public int insert( SBBS_Article sbbs_Article) throws SQLException;
	
	public SBBS_Article selectById( int artId)throws SQLException;
	
	public void increaseReadCount(int sbbs_artid)throws SQLException;
	
	public String selectLastSequenceNumber(String searchMaxSeqNum, String searchMinSeqNum) 
	throws SQLException;
	
	public int update(SBBS_Article article) throws SQLException ;
	
	public void delete( int artId) throws SQLException;
	
}
