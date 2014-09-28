package service;

import java.sql.SQLException;
import java.util.List;

import model.Post;
import model.PostListModel;

import org.apache.log4j.Logger;

import controller.PostController;
import dao.PostDao;
import dao.PostDaoImpl;

public class PostServiceImpl implements PostService{
	
	private PostDao postDao;

	public void setPostDao(PostDaoImpl postDao) {
		this.postDao = postDao;
	}

	static Logger logger = Logger.getLogger(PostController.class);
	
	public PostListModel getPostList(String searchDong){
		
		List<Post> postList = null;
		int result = 0;
		PostListModel postListView = null;
		
		try {
			logger.debug("PostServiceImpl의 getPostList메서드실행");
			
			result = postDao.selectCount(searchDong);
			
			if (result == 0) { // 게시판 글 수가 0이면
				return new PostListModel(); // PostListModel객체 를 리턴하고
			}

			logger.debug("PostDaoImple의 select메서드 실행");
			postList = postDao.select(searchDong); 
			postListView = new PostListModel(postList);


			return postListView;
			
		} catch (SQLException e) {
			throw new RuntimeException("DB 에러 발생:" + e.getMessage(), e);
		}
	}
}

