package service.bbs.sbbs;


import java.sql.SQLException;
import java.text.DecimalFormat;

import model.SBBS_Article;
import model.SBBS_ReplyingRequest;

import service.ArticleNotFoundException;
import service.CannotReplyArticleException;
import service.IdGenerationFailedException;
import service.LastChildAleadyExistsException;

import dao.SBBS_ArticleDao;


public class SBBS_WriteServiceImpl implements SBBS_WriteService {
	private SBBS_ArticleDao sbbs_ArticleDao;

	public void setSbbs_ArticleDao(SBBS_ArticleDao sbbs_ArticleDao) {
		this.sbbs_ArticleDao = sbbs_ArticleDao;
	}

	public SBBS_Article write(SBBS_Article sbbs_Article)
			throws IdGenerationFailedException, SQLException {
		int groupId = sbbs_ArticleDao.generateNextId("sbbs");
		sbbs_Article.setSbbs_groupid(groupId);
		DecimalFormat decimalFormat = new DecimalFormat("0000000000");
		sbbs_Article.setSbbs_SequenceNo(decimalFormat.format(groupId) + "999999");
			
		int articleId = sbbs_ArticleDao.insert(sbbs_Article);
		
		if (articleId == -1) {
			throw new RuntimeException("DB 삽입 안됨: " + articleId);
		}
	
		return sbbs_Article;
	}

	public SBBS_Article writeReply(SBBS_ReplyingRequest replyingRequest)
			throws ArticleNotFoundException, CannotReplyArticleException,
			LastChildAleadyExistsException, SQLException {

		System.out.println("writeReply method 들어옴");
		SBBS_Article article = replyingRequest.toArticle();
		SBBS_Article parent = sbbs_ArticleDao.selectById(replyingRequest
				.getParent_sbbs_artid());
		System.out.println("writeReply method 들어옴2");
		try {
			checkParent(parent, replyingRequest.getParent_sbbs_artid());
		} catch (Exception e) {
			if (e instanceof ArticleNotFoundException) {
				throw (ArticleNotFoundException) e;
			} else if (e instanceof CannotReplyArticleException) {
				throw (CannotReplyArticleException) e;
			} else if (e instanceof LastChildAleadyExistsException) {
				throw (LastChildAleadyExistsException) e;
			}
		}
		System.out.println("writeReply method 들어옴3");
		String searchMaxSeqNum = parent.getSbbs_SequenceNo();
		String searchMinSeqNum = getSearchMinSeqNum(parent);
		System.out.println("writeReply method 들어옴4");
		String lastChildSeq = sbbs_ArticleDao.selectLastSequenceNumber(
				searchMaxSeqNum, searchMinSeqNum);

		String sequenceNumber = getSequenceNumber(parent, lastChildSeq);
		System.out.println("writeReply method 들어옴5");
		article.setSbbs_groupid(parent.getSbbs_groupid());
		article.setSbbs_SequenceNo(sequenceNumber);

		article.setSbbs_picnum("0");

		System.out.println(article.getSt_num()+"article.getSt_num()");
		int articleId = sbbs_ArticleDao.insert(article);
		if (articleId == -1) {
			
			throw new RuntimeException("DB 삽입 안됨: " + articleId);
		}

		return article;

	}

	private void checkParent(SBBS_Article parent, int parentId)
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

	private String getSearchMinSeqNum(SBBS_Article parent) {
		String parentSeqNum = parent.getSbbs_SequenceNo();
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

	private String getSequenceNumber(SBBS_Article parent, String lastChildSeq)
			throws LastChildAleadyExistsException {
		long parentSeqLong = Long.parseLong(parent.getSbbs_SequenceNo());
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
