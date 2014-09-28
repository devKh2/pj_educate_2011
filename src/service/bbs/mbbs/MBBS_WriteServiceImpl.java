package service.bbs.mbbs;


import java.sql.SQLException;
import java.text.DecimalFormat;

import service.ArticleNotFoundException;
import service.CannotReplyArticleException;
import service.IdGenerationFailedException;
import service.LastChildAleadyExistsException;

import model.MBBS_Article;
import model.MBBS_ReplyingRequest;


import dao.MBBS_ArticleDao;


public class MBBS_WriteServiceImpl implements MBBS_WriteService {
	private MBBS_ArticleDao mbbs_ArticleDao;

	public void setMbbs_ArticleDao(MBBS_ArticleDao mbbs_ArticleDao) {
		this.mbbs_ArticleDao = mbbs_ArticleDao;
	}

	public MBBS_Article write(MBBS_Article mbbs_Article)
			throws IdGenerationFailedException, SQLException {
		int groupId = mbbs_ArticleDao.generateNextId("mbbs");
		mbbs_Article.setMbbs_groupid(groupId);
		DecimalFormat decimalFormat = new DecimalFormat("0000000000");
		mbbs_Article.setMbbs_SequenceNo(decimalFormat.format(groupId) + "999999");
			
		int articleId = mbbs_ArticleDao.insert(mbbs_Article);
		
		if (articleId == -1) {
			throw new RuntimeException("DB 삽입 안됨: " + articleId);
		}
	
		return mbbs_Article;
	}

	public MBBS_Article writeReply(MBBS_ReplyingRequest replyingRequest)
			throws ArticleNotFoundException, CannotReplyArticleException,
			LastChildAleadyExistsException, SQLException {

		MBBS_Article article = (MBBS_Article)replyingRequest;
		MBBS_Article parent = mbbs_ArticleDao.selectById(replyingRequest
				.getParent_mbbs_artid());
		try {
			checkParent(parent, replyingRequest.getParent_mbbs_artid());
		} catch (Exception e) {
			if (e instanceof ArticleNotFoundException) {
				throw (ArticleNotFoundException) e;
			} else if (e instanceof CannotReplyArticleException) {
				throw (CannotReplyArticleException) e;
			} else if (e instanceof LastChildAleadyExistsException) {
				throw (LastChildAleadyExistsException) e;
			}
		}

		String searchMaxSeqNum = parent.getMbbs_SequenceNo();
		String searchMinSeqNum = getSearchMinSeqNum(parent);

		String lastChildSeq = mbbs_ArticleDao.selectLastSequenceNumber(
				searchMaxSeqNum, searchMinSeqNum);

		String sequenceNumber = getSequenceNumber(parent, lastChildSeq);

		article.setMbbs_groupid(parent.getMbbs_groupid());
		article.setMbbs_SequenceNo(sequenceNumber);

		int articleId = mbbs_ArticleDao.insert(article);
		if (articleId == -1) {
			
			throw new RuntimeException("DB 삽입 안됨: " + articleId);
		}

		return article;

	}

	private void checkParent(MBBS_Article parent, int parentId)
			throws ArticleNotFoundException, CannotReplyArticleException {
		if (parent == null){
			
			throw new ArticleNotFoundException("부모글이 존재하지 않음: " + parentId);
		}
		int parentLevel = parent.getLevel();
		if (parentLevel == 3){
			
			throw new CannotReplyArticleException("마지막 레벨 글에는 답글을 달 수 없습니다:"
					+ parent.getCu_id());
		}
	}

	private String getSearchMinSeqNum(MBBS_Article parent) {
		String parentSeqNum = parent.getMbbs_SequenceNo();
		DecimalFormat decimalFormat = new DecimalFormat("0000000000000000");
		long parentSeqLongValue = Long.parseLong(parentSeqNum);
		long searchMinLongValue = 0;
		switch (parent.getLevel()) {
		case 0:
			searchMinLongValue = parentSeqLongValue / 1000000L * 1000000L;
			break;
		case 1:
			searchMinLongValue = parentSeqLongValue / 10000L * 10000L;
			break;
		case 2:
			searchMinLongValue = parentSeqLongValue / 100L * 100L;
			break;
		}
		return decimalFormat.format(searchMinLongValue);
	}

	private String getSequenceNumber(MBBS_Article parent, String lastChildSeq)
			throws LastChildAleadyExistsException {
		long parentSeqLong = Long.parseLong(parent.getMbbs_SequenceNo());
		int parentLevel = parent.getLevel();

		long decUnit = 0;
		if (parentLevel == 0) {
			decUnit = 10000L;
		} else if (parentLevel == 1) {
			decUnit = 100L;
		} else if (parentLevel == 2) {
			decUnit = 1L;
		}

		String sequenceNumber = null;

		DecimalFormat decimalFormat = new DecimalFormat("0000000000000000");
		if (lastChildSeq == null) { // 답변 글이 없음
			sequenceNumber = decimalFormat.format(parentSeqLong - decUnit);
		} else { // 답변 글이 있음
			// 마지막 답변 글인지 확인
			String orderOfLastChildSeq = null;
			
			if (parentLevel == 0) {
				orderOfLastChildSeq = lastChildSeq.substring(10, 12);
				sequenceNumber = lastChildSeq.substring(0, 12) + "9999";
			} else if (parentLevel == 1) {
				orderOfLastChildSeq = lastChildSeq.substring(12, 14);
				sequenceNumber = lastChildSeq.substring(0, 14) + "99";
			} else if (parentLevel == 2) {
				orderOfLastChildSeq = lastChildSeq.substring(14, 16);
				sequenceNumber = lastChildSeq;
			}
			if (orderOfLastChildSeq.equals("00")) {
				throw new LastChildAleadyExistsException("마지막 자식 글이 이미 존재합니다:"
						+ lastChildSeq);
			}
			long seq = Long.parseLong(sequenceNumber) - decUnit;
			sequenceNumber = decimalFormat.format(seq);
		}
		return sequenceNumber;
	}

}
