package dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.Post;

import org.apache.log4j.Logger;

import com.ibatis.sqlmap.client.SqlMapClient;

import controller.PostController;

public class PostDaoImpl implements PostDao {

	static Logger logger = Logger.getLogger(PostController.class);

	private SqlMapClient sqlMapClient;

	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}
	
	public int selectCount(String searchDong) throws SQLException {
		System.out.println(searchDong+ " 검색결과수: "+(Integer)(sqlMapClient.queryForObject("post.count", searchDong)));
		return (Integer)(sqlMapClient.queryForObject("post.count", searchDong));
	}
	
	public List<Post> select(String searchDong) throws SQLException {

		Map<String, String> params = new HashMap<String, String>();
		params.put("searchDong", searchDong);
		return (List<Post>)sqlMapClient.queryForList("post.list", params);
	}
}
