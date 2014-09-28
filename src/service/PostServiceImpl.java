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
			logger.debug("PostServiceImpl�� getPostList�޼������");
			
			result = postDao.selectCount(searchDong);
			
			if (result == 0) { // �Խ��� �� ���� 0�̸�
				return new PostListModel(); // PostListModel��ü �� �����ϰ�
			}

			logger.debug("PostDaoImple�� select�޼��� ����");
			postList = postDao.select(searchDong); 
			postListView = new PostListModel(postList);


			return postListView;
			
		} catch (SQLException e) {
			throw new RuntimeException("DB ���� �߻�:" + e.getMessage(), e);
		}
	}
}

