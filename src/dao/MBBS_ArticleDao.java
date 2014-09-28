package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import service.IdGenerationFailedException;

import model.MBBS_Article;
import model.SearchParam;


public interface MBBS_ArticleDao {

	public int selectCount(String searchkind, String search) throws SQLException;
	
	public List<MBBS_Article> select(int firstRow,int endRow,String searchkind, String search) throws SQLException;
	
	// 검색 엔진을 통해 검색 했을 때, 검색된 결과 게시판 개수 가져오기
	public int selectCount_search(String keyWord)throws SQLException;
	// 검색 엔진을 통해 검색 했을 때, 검색된 결과 게시판 list를  가져오기.
	public List<MBBS_Article> selectSearSort(int firstRow, int endRow, SearchParam searParam) throws SQLException;
	
	public int generateNextId(String sequenceName) throws IdGenerationFailedException ,SQLException;
	
	public int insert( MBBS_Article mbbs_Article) throws SQLException;
	
	public MBBS_Article selectById( int artId)throws SQLException;
	
	public void increaseReadCount(int mbbs_artid)throws SQLException;
	
	public String selectLastSequenceNumber(String searchMaxSeqNum, String searchMinSeqNum) 
	throws SQLException;
	
	public int update(MBBS_Article article) throws SQLException ;
	
	public void delete( int artId) throws SQLException;
	
	public ArrayList<MBBS_Article> random_3_List() throws SQLException;
	
}
