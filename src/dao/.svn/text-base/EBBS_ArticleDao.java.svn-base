package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.EBBS_Article;
import model.Random4_EBBS;

import service.IdGenerationFailedException;




public interface EBBS_ArticleDao {

	public int selectCount(int stnum) throws SQLException;
	
	public List<EBBS_Article> select(int firstRow,int endRow,int stnum) throws SQLException;
	
	public int generateNextId(String sequenceName) throws IdGenerationFailedException ,SQLException;
	
	public int insert( EBBS_Article ebbs_Article) throws SQLException;
	
	public EBBS_Article selectById( int artId)throws SQLException;
	
	public void increaseReadCount(int ebbs_artid)throws SQLException;
	
	public String selectLastSequenceNumber(String searchMaxSeqNum, String searchMinSeqNum) 
	throws SQLException;
	
	public int update(EBBS_Article article) throws SQLException ;
	
	public void delete( int artId) throws SQLException;
	
	public int id_search(String user_id,int stnum)throws SQLException;
	
	public ArrayList<Random4_EBBS> get_4list() throws SQLException;
	
}
