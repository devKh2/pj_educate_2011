package controller.bbs.nbbs;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import model.Member;
import model.NBBS_Article;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.IdGenerationFailedException;
import service.bbs.nbbs.NBBS_WriteService;
import validator.NBBS_Validator;






@Controller
@RequestMapping("/nbbs_write.do")
public class NBBS_WriteController {
	
	static Logger logger = Logger.getLogger(NBBS_WriteController.class);
	
	private NBBS_WriteService nbbs_WriteService;
	
	//------------------------------------------------------------------------
	public void setNbbs_WriteService(NBBS_WriteService nbbs_WriteService) {
		this.nbbs_WriteService = nbbs_WriteService;
	}

	//------------------------------------------------------------------------
	@ModelAttribute("nbbs_Article")
	protected Object formBackingObject() throws Exception {
		return new NBBS_Article();
	}
	@RequestMapping( method =RequestMethod.GET)
	public ModelAndView  form(HttpSession session){
		ModelAndView mav = new ModelAndView("bbs/nbbs_write_form");
		Member member = (Member)session.getAttribute("member");
		String member_type = member.getMember_type();
		System.out.println(member_type);
		if(!member_type.equals("administrator")){
			mav.setViewName("redirect:/nbbs_list.do");
		}
		return mav;
	}
	@RequestMapping( method = RequestMethod.POST)
	public ModelAndView write(HttpServletRequest request,@ModelAttribute NBBS_Article nbbs_Article,BindingResult errors){
		ModelAndView mav = new ModelAndView("redirect:/nbbs_list.do");
		new NBBS_Validator().validate(nbbs_Article, errors);
		if(errors.hasErrors()){
			mav.setViewName("bbs/nbbs_write_form");
			mav.addObject("nbbs_Article", nbbs_Article);
			return mav;
		}
		
		try {
				nbbs_WriteService.write(nbbs_Article);
				
			} catch (IdGenerationFailedException e) {
				e.printStackTrace();
			}catch (SQLException e) {
				e.printStackTrace();
		}
		
		return mav;
	}
	
	
	

}
