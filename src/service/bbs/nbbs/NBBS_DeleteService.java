package service.bbs.nbbs;

import service.ArticleNotFoundException;
import service.InvalidPasswordException;
import model.NBBS_UpdateRequest;

public interface NBBS_DeleteService {
	public void delete(NBBS_UpdateRequest dr) 
		throws ArticleNotFoundException,InvalidPasswordException;
}
