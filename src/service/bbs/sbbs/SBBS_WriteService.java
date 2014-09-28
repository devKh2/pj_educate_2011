package service.bbs.sbbs;

import java.sql.SQLException;

import model.SBBS_Article;
import model.SBBS_ReplyingRequest;

import service.ArticleNotFoundException;
import service.CannotReplyArticleException;
import service.IdGenerationFailedException;
import service.LastChildAleadyExistsException;



public interface SBBS_WriteService {
	public SBBS_Article write(SBBS_Article sbbs_Article) throws IdGenerationFailedException,SQLException;

	public SBBS_Article writeReply(SBBS_ReplyingRequest replyingRequest)
			throws ArticleNotFoundException, 
			CannotReplyArticleException,
			LastChildAleadyExistsException, SQLException ;
}
