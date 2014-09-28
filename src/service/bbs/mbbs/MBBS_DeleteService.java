package service.bbs.mbbs;

import service.ArticleNotFoundException;
import service.InvalidPasswordException;
import model.MBBS_UpdateRequest;

public interface MBBS_DeleteService {
	
	// �Խñ��� ���� �� ���� ���̴� method �Դϴ�.
	public void delete(MBBS_UpdateRequest dr) 
		throws ArticleNotFoundException,InvalidPasswordException;
	
	// �����ڰ� �Խñ��� ���� �� ���� ���̴� method �Դϴ�. 
	public void administrator_delete(MBBS_UpdateRequest dr) 
		throws ArticleNotFoundException,InvalidPasswordException;
}
