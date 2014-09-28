package controller.bbs.sbbs;

import javax.servlet.http.HttpSession;



import model.Member;
import model.SBBS_UpdateRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import service.ArticleNotFoundException;
import service.InvalidPasswordException;
import service.bbs.sbbs.SBBS_DeleteService;


@Controller
@RequestMapping("/sbbs_delete.do")
public class SBBS_DeleteController {
	static Logger logger = Logger.getLogger(SBBS_DeleteController.class);
	private SBBS_DeleteService sbbs_deleteService;
	
	public void setSbbs_deleteService(SBBS_DeleteService sbbs_deleteService) {
		this.sbbs_deleteService = sbbs_deleteService;
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public String delete(
			@RequestParam(value="p",defaultValue="1")String page,
			@RequestParam(value="articleId") int articleId,
			@RequestParam(value="stnum")int stnum,
			HttpSession session
			) throws Exception{
		System.out.println("µé¾î¿È µé¾î¿È µé¾î¿È µé¾î¿È µé¾î¿È");
		SBBS_UpdateRequest ur = new SBBS_UpdateRequest();
		String message="±Û¾´ÀÌ¿Í ¾ÆÀÌµð°¡ ´Ù¸¨´Ï´Ù.";
		ur.setSbbs_artid(articleId);
		Member member =(Member)session.getAttribute("member");
		ur.setMember_id(member.getId());
		System.out.println(member.getId());
		String form = "redirect:/sbbs_read.do?artId="+articleId+"&p="+page+"&message="+message;
		
		try {
			if(member.getMember_type().equals("customer")){
				sbbs_deleteService.delete(ur);
			}else{
				sbbs_deleteService.admin_delete(ur,member);
			}
			
		} catch (ArticleNotFoundException e) {
			logger.debug(e.getMessage());
			
			return form;
		} catch (InvalidPasswordException e) {
			logger.debug(e.getMessage());
			return form;
		}
		
		return "redirect:/sbbs_list.do?p=" +page+"&stnum="+stnum;
	}
}
