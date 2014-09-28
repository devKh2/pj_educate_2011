package controller.bbs.sbbs;


import model.SBBS_Article;
import model.SBBS_UpdateRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import service.ArticleNotFoundException;
import service.InvalidPasswordException;
import service.bbs.sbbs.SBBS_UpdateService;



@Controller
@RequestMapping("/sbbs_update.do")
public class SBBS_UpdateController {
	static Logger logger = Logger.getLogger(SBBS_UpdateController.class);
	
	private SBBS_UpdateService sbbs_updateService;
	
	public void setSbbs_updateService(SBBS_UpdateService sbbs_updateService) {
		this.sbbs_updateService = sbbs_updateService;
	}
	
	@ModelAttribute("command")
	protected Object formBackingObject(
			@RequestParam(value="articleId")int articleId,
			@RequestParam(value="stnum")int stnum)throws Exception{
		
		System.out.println("SBBS_UpdateController ·Î µé¾î¿È");
		SBBS_UpdateRequest ur = new SBBS_UpdateRequest();
		System.out.println(articleId);
		SBBS_Article article = sbbs_updateService.getArticle(articleId);
		
		ur.setSbbs_artid(article.getSbbs_artid());
		ur.setSbbs_title(article.getSbbs_title());
		ur.setSbbs_content(article.getSbbs_content());
		ur.setCu_id(article.getCu_id());
		ur.setSt_num(stnum);
		
		return ur;
	}
	
	
	@RequestMapping(method = RequestMethod.GET)
	public String form(@RequestParam(value="p", defaultValue="1") int page,
					   @RequestParam(value="articleId") int articleId,
					   @RequestParam(value="articleCuId") String articleCuId) throws ArticleNotFoundException{
		System.out.println("SBBS_UpdateController getÀ¸·Î µé¾î¿È");
	return "bbs/sbbs_update_form_view";
}
	@RequestMapping(method = RequestMethod.POST)
	public String update(@ModelAttribute("command")SBBS_UpdateRequest ur,
			BindingResult errors,
			@RequestParam(value="p",defaultValue="1") String page,
			@RequestParam(value="articleId") String articleId,
			@RequestParam(value="stnum") int stnum)throws Exception{
		System.out.println("update POST ¿¡ µé¾î¿È");
		try{
			SBBS_Article article = sbbs_updateService.update(ur);
			if(article == null){
				System.out.println("¾ÆÀÌµð°¡ ´Ù¸¨´Ï´Ù.");
			}
		}catch (InvalidPasswordException e){
			logger.debug(e.getMessage());
			errors.reject("invalidPassword");
			return "sbbs_update_form_view";
		}
		
		return "redirect:/sbbs_list.do?p=" +page+"&stnum="+stnum;	
	}
	

}
