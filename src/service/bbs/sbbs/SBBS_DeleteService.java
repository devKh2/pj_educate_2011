package service.bbs.sbbs;

import service.ArticleNotFoundException;
import service.InvalidPasswordException;
import model.Member;
import model.SBBS_UpdateRequest;

public interface SBBS_DeleteService {
	public void delete(SBBS_UpdateRequest ur) 
		throws ArticleNotFoundException,InvalidPasswordException;
	public void admin_delete(SBBS_UpdateRequest ur,Member member) 
	throws ArticleNotFoundException,InvalidPasswordException;
}
