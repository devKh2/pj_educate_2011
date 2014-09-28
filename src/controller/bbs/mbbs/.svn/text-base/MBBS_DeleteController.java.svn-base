package controller.bbs.mbbs;

import javax.servlet.http.HttpSession;

import model.MBBS_UpdateRequest;
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
import service.bbs.mbbs.MBBS_DeleteService;

@Controller
@RequestMapping("/mbbs_delete.do")
public class MBBS_DeleteController {
	static Logger logger = Logger.getLogger(MBBS_DeleteController.class);
	private MBBS_DeleteService mbbs_deleteService;
	
	public void setMbbs_deleteService(MBBS_DeleteService mbbs_deleteService) {
		this.mbbs_deleteService = mbbs_deleteService;
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public String delete(HttpSession session,
			@RequestParam(value="p",defaultValue="1")int page,
			@RequestParam(value="articleId") int articleId) throws Exception{
		
		MBBS_UpdateRequest ur = new MBBS_UpdateRequest();
		ur.setMbbs_artid(articleId);
		Member member =(Member)session.getAttribute("member");
		ur.setMember_id(member.getId());
		System.out.println(member.getId());
		String getMember_type= member.getMember_type();
		String form = "redirect:/mbbs_list.do?p=" +page;
		try {
			if(getMember_type.equals("administrator")){
				mbbs_deleteService.administrator_delete(ur);
			}else{
				mbbs_deleteService.delete(ur);
			}
			
		} catch (ArticleNotFoundException e) {
			logger.debug(e.getMessage());
			
			return form;
		} catch (InvalidPasswordException e) {
			logger.debug(e.getMessage());
			return form;
		}
		
		return "redirect:/mbbs_list.do?p=" +page;
	}
}
