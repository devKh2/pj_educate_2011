package service.bbs.mbbs;

import service.ArticleNotFoundException;
import service.InvalidPasswordException;
import model.MBBS_UpdateRequest;

public interface MBBS_DeleteService {
	
	// 게시글을 삭제 할 때에 쓰이는 method 입니다.
	public void delete(MBBS_UpdateRequest dr) 
		throws ArticleNotFoundException,InvalidPasswordException;
	
	// 관리자가 게시글을 삭제 할 때에 쓰이는 method 입니다. 
	public void administrator_delete(MBBS_UpdateRequest dr) 
		throws ArticleNotFoundException,InvalidPasswordException;
}
