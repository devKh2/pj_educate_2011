package controller.bbs.nbbs;



import model.NBBS_Article;
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
import service.bbs.nbbs.NBBS_UpdateService;



@Controller
@RequestMapping("/nbbs_update.do")
public class NBBS_UpdateController {
	static Logger logger = Logger.getLogger(NBBS_UpdateController.class);
	
	private NBBS_UpdateService nbbs_updateService;
	
	public void setNbbs_updateService(NBBS_UpdateService nbbs_updateService) {
		this.nbbs_updateService = nbbs_updateService;
	}


	@ModelAttribute("command")
	protected Object formBackingObject(
			@RequestParam(value="articleId",required=true)int articleId,
			@RequestParam(value="memberId",required=false)String memberId)throws Exception{
		System.out.println("들어왔음.NBBS_UpdateController ");
		NBBS_UpdateRequest ur = new NBBS_UpdateRequest();
		System.out.println(articleId);
		NBBS_Article article = nbbs_updateService.getArticle(articleId);
		
		ur.setNotice_artid(article.getNotice_artid());
		ur.setNotice_title(article.getNotice_title());
		ur.setNotice_content(article.getNotice_content());
		ur.setAdmin_id(article.getAdmin_id());
		ur.setMember_id(memberId);
	
		return ur;
	}


	@RequestMapping(method = RequestMethod.GET)
	public String form() throws ArticleNotFoundException{
	return "bbs/nbbs_update_form_view";
}
	@RequestMapping(method = RequestMethod.POST)
	public String update(@ModelAttribute("command")NBBS_UpdateRequest ur,
			BindingResult errors,
			@RequestParam(value="p",defaultValue="1") String page)throws Exception{
		System.out.println(" post 들어왔음.NBBS_UpdateController ");
		System.out.println("ur.getAdmin_id()"+ur.getAdmin_id());
		System.out.println("ur.getMember_id()"+ur.getMember_id());

		try{
			NBBS_Article article = nbbs_updateService.update(ur);
			if(article == null){
				System.out.println("아이디가 다릅니다.");
			}
		}catch (InvalidPasswordException e){
			logger.debug(e.getMessage());
			errors.reject("invalidPassword");
			return "nbbs_update_form_view";
		}
		
		return "redirect:/nbbs_list.do?p=" +page;	
	}
	

}
