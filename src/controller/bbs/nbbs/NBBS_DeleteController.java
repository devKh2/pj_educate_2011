package controller.bbs.nbbs;

import javax.servlet.http.HttpSession;


import model.Member;
import model.NBBS_UpdateRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import service.ArticleNotFoundException;
import service.InvalidPasswordException;
import service.bbs.nbbs.NBBS_DeleteService;

@Controller
@RequestMapping("/nbbs_delete.do")
public class NBBS_DeleteController {
	static Logger logger = Logger.getLogger(NBBS_DeleteController.class);
	private NBBS_DeleteService nbbs_deleteService;
	
	public void setNbbs_deleteService(NBBS_DeleteService nbbs_deleteService) {
		this.nbbs_deleteService = nbbs_deleteService;
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public String delete(
			@RequestParam(value="p",defaultValue="1")String page,
			@RequestParam(value="articleId") int articleId,
			HttpSession session
			) throws Exception{
		NBBS_UpdateRequest ur = new NBBS_UpdateRequest();
		
		ur.setNotice_artid(articleId);
		Member member =(Member)session.getAttribute("member");
		String member_type = member.getMember_type();
		String form = null;
		System.out.println(member_type);
		if(!member_type.equals("administrator")){
			return "redirect:/nbbs_list.do?p=" +page;
		}
		try{
			nbbs_deleteService.delete(ur);
		} catch (ArticleNotFoundException e) {
			logger.debug(e.getMessage());
			
			return form;
		} catch (InvalidPasswordException e) {
			logger.debug(e.getMessage());
			return form;
		}
		
		return "redirect:/nbbs_list.do?p=" +page;
	}
}
