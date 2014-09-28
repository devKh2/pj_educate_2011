package controller.bbs.ebbs;


import model.EBBS_Article;
import model.EBBS_UpdateRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import service.ArticleNotFoundException;
import service.InvalidPasswordException;



@Controller
@RequestMapping("/ebbs_update.do")
public class EBBS_UpdateController {
	/*
	static Logger logger = Logger.getLogger(EBBS_UpdateController.class);
	
	private EBBS_UpdateService ebbs_updateService;
	
	public void setEbbs_updateService(EBBS_UpdateService ebbs_updateService) {
		this.ebbs_updateService = ebbs_updateService;
	}


	@ModelAttribute("command")
	protected Object formBackingObject(
			@RequestParam(value="articleId",required=true)int articleId)throws Exception{

		EBBS_UpdateRequest ur = new EBBS_UpdateRequest();
		System.out.println(articleId);
		EBBS_Article article = ebbs_updateService.getArticle(articleId);
		
		ur.setEbbs_artid(article.getEbbs_artid());
		ur.setEbbs_title(article.getEbbs_title());
		ur.setEbbs_score(article.getEbbs_score());
		ur.setCu_id(article.getCu_id());
	
		return ur;
	}


	@RequestMapping(method = RequestMethod.GET)
	public String form() throws ArticleNotFoundException{
	return "bbs/ebbs_update_form_view";
}
	@RequestMapping(method = RequestMethod.POST)
	public String update(@ModelAttribute("command")EBBS_UpdateRequest ur,
			BindingResult errors,
			@RequestParam(value="p",defaultValue="1") String page)throws Exception{
		try{
			EBBS_Article article = ebbs_updateService.update(ur);
			if(article == null){
				System.out.println("아이디가 다릅니다.");
			}
		}catch (InvalidPasswordException e){
			logger.debug(e.getMessage());
			errors.reject("invalidPassword");
			return "ebbs_update_form_view";
		}
		
		return "redirect:/ebbs_list.do?p=" +page;	
	}
	
*/
}
