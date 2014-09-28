package service.bbs.mbbs;

import java.sql.SQLException;

import service.ArticleNotFoundException;
import service.CannotReplyArticleException;
import service.IdGenerationFailedException;
import service.LastChildAleadyExistsException;

import model.MBBS_Article;
import model.MBBS_ReplyingRequest;


public interface MBBS_WriteService {
	
	//�Խñ��� �ۼ��ϱ� ���� ����ϴ� method �Դϴ�.
	public MBBS_Article write(MBBS_Article mbbs_Article) throws IdGenerationFailedException,SQLException;

	//reply �Խñ��� �ۼ��ϱ� ���� ����ϴ� method �Դϴ�.
	public MBBS_Article writeReply(MBBS_ReplyingRequest replyingRequest)
			throws ArticleNotFoundException, 
			CannotReplyArticleException,
			LastChildAleadyExistsException, SQLException ;
}
