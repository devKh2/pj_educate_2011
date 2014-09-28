package controller.bbs.ebbs;

import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.EBBS_Article;
import model.Member;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import service.IdGenerationFailedException;
import service.bbs.ebbs.EBBS_WriteService;
import validator.EBBS_Validator;


@Controller
@RequestMapping("/ebbs_write.do")
public class EBBS_WriteController {
	
	static Logger logger = Logger.getLogger(EBBS_WriteController.class);
	
	private EBBS_WriteService ebbs_WriteService;
	
	//------------------------------------------------------------------------
	public void setEbbs_WriteService(EBBS_WriteService ebbs_WriteService) {
		this.ebbs_WriteService = ebbs_WriteService;
	}
	//------------------------------------------------------------------------
	@ModelAttribute("ebbs_Article")
	protected Object formBackingObject(@RequestParam("stnum") int stnum) throws Exception {
		System.out.println("EBBS_WriteController 도착");
		EBBS_Article ebbs=new EBBS_Article();
		ebbs.setSt_num(stnum);
		return ebbs;
	}
	@RequestMapping( method =RequestMethod.GET)
	public ModelAndView  form(HttpSession session,@RequestParam("stnum") int stnum){
		ModelAndView mav = new ModelAndView("bbs/ebbs_write_form");
		
		Member member = (Member)session.getAttribute("member");
		String user_id = member.getId();
		int user_article = 0;
		System.out.println("user_id = " +user_id);
		try {
			user_article=ebbs_WriteService.id_search(user_id,stnum);
			System.out.println("user_article=ebbs_WriteService.id_search(user_id,stnum); 통과");
		}catch (SQLException e) {
			e.printStackTrace();
		}
		if(user_article!=0){
			mav.setViewName("redirect:/ebbs_list.do");
			String message = "평가글을 이미 등록하셨습니다.";
			mav.addObject("message",message);
			mav.addObject("stnum",stnum);
		}
		
		return mav;
	}
	@RequestMapping( method = RequestMethod.POST)
	public ModelAndView write(HttpSession session,
							  @ModelAttribute EBBS_Article ebbs_Article,
							  BindingResult errors,
							  @RequestParam("stnum") int stnum){
		System.out.println(" Write Controller @RequestMapping( method = RequestMethod.POST) 들어옴");
		ModelAndView mav = new ModelAndView("redirect:/ebbs_list.do");
		Member member = (Member)session.getAttribute("member");
		ebbs_Article.setCu_id(member.getId());
		ebbs_Article.setSt_num(stnum);
		
		new EBBS_Validator().validate(ebbs_Article, errors);
		if(errors.hasErrors()){
			mav.setViewName("bbs/ebbs_write_form");
			mav.addObject("ebbs_Article", ebbs_Article);
			return mav;
		}
		
		
		System.out.println(ebbs_Article.getSt_num() + ebbs_Article.getCu_id() + ebbs_Article.getEbbs_score());
		try {
				ebbs_WriteService.write(ebbs_Article);
				
			} catch (IdGenerationFailedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}catch (SQLException e) {
				e.printStackTrace();
		}
		mav.addObject("stnum", stnum);
		return mav;
	}
	
	
	

}
