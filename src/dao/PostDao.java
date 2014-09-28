package dao;

import java.sql.SQLException;
import java.util.List;

import model.Post;

public interface PostDao {

	public int selectCount(String searchDong) throws SQLException;
	public List<Post> select(String searchDong) throws SQLException;
	
}
