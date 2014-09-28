package controller.bbs.ebbs;

import javax.servlet.http.HttpSession;

import model.EBBS_UpdateRequest;
import model.Member;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import service.ArticleNotFoundException;
import service.InvalidPasswordException;
import service.bbs.ebbs.EBBS_DeleteService;


@Controller
@RequestMapping("/ebbs_delete.do")
public class EBBS_DeleteController {
	static Logger logger = Logger.getLogger(EBBS_DeleteController.class);
	private EBBS_DeleteService ebbs_deleteService;
	
	public void setEbbs_deleteService(EBBS_DeleteService ebbs_deleteService) {
		this.ebbs_deleteService = ebbs_deleteService;
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public String delete(
			@RequestParam(value="p",defaultValue="1")String page,
			@RequestParam(value="articleId") int articleId,
			@RequestParam(value="stnum", defaultValue="1")int stnum,
			HttpSession session
			) throws Exception{
System.out.println("들어왔음. controller");
/*
		ur.setEbbs_artid(articleId);
		Member member =(Member)session.getAttribute("member");
		ur.setMember_id(member.getId());
		System.out.println(member.getId());
		String form = "ebbs_delete_form";
*/
		Member member =(Member)session.getAttribute("member");
		String member_type = member.getMember_type();
		System.out.println("articleId = "+ articleId );
		System.out.println("p = " + page);
		if(member_type.equals("administrator")){
			ebbs_deleteService.delete(articleId);
		}
/*
		try {
			ebbs_deleteService.delete(ur);
		} catch (ArticleNotFoundException e) {
			logger.debug(e.getMessage());
			
			return form;
		} catch (InvalidPasswordException e) {
			logger.debug(e.getMessage());
			return form;
		}
*/	
		return "redirect:/ebbs_list.do?p=" +page+"&stnum="+stnum;
	}
}
