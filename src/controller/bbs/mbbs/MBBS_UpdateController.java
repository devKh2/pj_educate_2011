package controller.bbs.mbbs;

import javax.servlet.http.HttpSession;

import model.MBBS_Article;
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
import service.bbs.mbbs.MBBS_UpdateService;



@Controller
@RequestMapping("/mbbs_update.do")
public class MBBS_UpdateController {
	static Logger logger = Logger.getLogger(MBBS_UpdateController.class);
	
	private MBBS_UpdateService mbbs_updateService;
	
	public void setMbbs_updateService(MBBS_UpdateService mbbs_updateService) {
		this.mbbs_updateService = mbbs_updateService;
	}


	@ModelAttribute("command")
	protected Object formBackingObject(@RequestParam(value="articleId") int articleId	)throws Exception{
		MBBS_UpdateRequest ur = new MBBS_UpdateRequest();
		System.out.println(articleId);
		MBBS_Article article = mbbs_updateService.getArticle(articleId);
		ur.setMbbs_artid(article.getMbbs_artid());
		ur.setMbbs_title(article.getMbbs_title());
		ur.setMbbs_content(article.getMbbs_content());
		return ur;
	}


	@RequestMapping(method = RequestMethod.GET)
	public String form(HttpSession session,
			@RequestParam(value="articleId") int articleId,
			@RequestParam(value="cu_id") String cu_id,
			@RequestParam(value="p" ,defaultValue="1") int page) throws ArticleNotFoundException{
		String view = "bbs/mbbs_update_form_view";
		
		Member member = (Member)session.getAttribute("member");
		String userId = member.getId();
		String member_type = member.getMember_type();
		System.out.println("userId = "+userId);
		System.out.println("cu_id = "+cu_id);
		if(member_type.equals("administrator")){
			return view;
		}
		if(! cu_id.equals(userId)){
			view = "redirect:/mbbs_list.do?p=" +page;
		}
		
	return view;
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String update(HttpSession session,
			@ModelAttribute("command")MBBS_UpdateRequest ur,
			BindingResult errors,
			@RequestParam(value="p",defaultValue="1") String page)throws Exception{
		
		try{
			MBBS_Article article = null;
			article = mbbs_updateService.update(ur);
			if(article == null){
				System.out.println("아이디가 다릅니다.");
			}
		}catch (InvalidPasswordException e){
			logger.debug(e.getMessage());
			errors.reject("invalidPassword");
			return "mbbs_update_form_view";
		}
		
		return "redirect:/mbbs_list.do?p=" +page;	
	}
	

}
