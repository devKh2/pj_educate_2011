package service.bbs.sbbs;


import java.sql.SQLException;

import service.ArticleNotFoundException;
import service.InvalidPasswordException;
import model.Member;
import model.SBBS_Article;
import model.SBBS_UpdateRequest;
import dao.SBBS_ArticleDao;


public class SBBS_DeleteServiceImpl implements SBBS_DeleteService{
	private SBBS_ArticleDao sbbs_ArticleDao;
	
	public void setSbbs_ArticleDao(SBBS_ArticleDao sbbs_ArticleDao) {
		this.sbbs_ArticleDao = sbbs_ArticleDao;
	}

	public void delete(SBBS_UpdateRequest ur) 
	throws ArticleNotFoundException,InvalidPasswordException {

		try {
			SBBS_Article sbbs_article=(SBBS_Article)sbbs_ArticleDao.selectById(ur.getSbbs_artid());
			ur.setCu_id(sbbs_article.getCu_id());
				if((ur.getCu_id()).equals(ur.getMember_id())){
					sbbs_ArticleDao.delete(ur.getSbbs_artid());
				}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		
		} finally {
			
		}
		
	}
	public void admin_delete(SBBS_UpdateRequest ur,Member member) 
	throws ArticleNotFoundException,InvalidPasswordException {
		try {
			SBBS_Article sbbs_article=(SBBS_Article)sbbs_ArticleDao.selectById(ur.getSbbs_artid());
			ur.setCu_id(sbbs_article.getCu_id());
			if(member.getMember_type().equals("administrator")){
				sbbs_ArticleDao.delete(ur.getSbbs_artid());
			}else if(member.getMember_type().equals("storeMember")){
				if(member.getSt_num()==sbbs_article.getSt_num()){
					sbbs_ArticleDao.delete(ur.getSbbs_artid());
				}
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		
		} finally {
			
		}
		
	}

}
