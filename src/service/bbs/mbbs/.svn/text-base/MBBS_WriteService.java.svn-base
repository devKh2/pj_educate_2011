package service.bbs.mbbs;

import java.sql.SQLException;

import service.ArticleNotFoundException;
import service.CannotReplyArticleException;
import service.IdGenerationFailedException;
import service.LastChildAleadyExistsException;

import model.MBBS_Article;
import model.MBBS_ReplyingRequest;


public interface MBBS_WriteService {
	
	//게시글을 작성하기 위해 사용하는 method 입니다.
	public MBBS_Article write(MBBS_Article mbbs_Article) throws IdGenerationFailedException,SQLException;

	//reply 게시글을 작성하기 위해 사용하는 method 입니다.
	public MBBS_Article writeReply(MBBS_ReplyingRequest replyingRequest)
			throws ArticleNotFoundException, 
			CannotReplyArticleException,
			LastChildAleadyExistsException, SQLException ;
}
