package controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import model.JoinRequest;
import model.Member;
import service.IdGenerationFailedException;
import service.JoinService;
import validator.JoinValidator;

@Controller
@RequestMapping("/memberModified.do")
public class MemberModifiedController {

	static Logger logger = Logger.getLogger(MemberModifiedController.class);
	
	private JoinService joinService;

	public void setJoinService(JoinService joinService) {
		this.joinService = joinService;
	}
	
	@ModelAttribute("command")
	protected Object formBackingObject() throws Exception {
		return new JoinRequest();
	}

	@RequestMapping(method = RequestMethod.GET)
	public String form(HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		//logger.debug("!!!!!!!!!!!!!!!!!!!!!!!" + member.getId() + member.getPw() + member.getUserName());
		logger.debug("MemberModifiedController.form()::::::GET");
		
		return "member/memberModified";
	}	
	
	@RequestMapping(value="mypage.do",method=RequestMethod.GET)
	public ModelAndView myPage(@ModelAttribute("command") JoinRequest jr){
		ModelAndView mav=new ModelAndView("member/memberModified");
		return mav;
	}

	@RequestMapping(method = RequestMethod.POST)
	public String save(@ModelAttribute("command") JoinRequest jr, BindingResult result) throws IdGenerationFailedException {
		// 1. 입력값 검증
		logger.debug("MemberModifiedController.form():::::::POST");
		new JoinValidator().validate(jr, result);
		
		if(result.hasErrors()){
			logger.debug(result.getAllErrors());
			logger.debug("result.hasErrors()실행");
			return "member/memberModified";
		}
		logger.debug("result.hasErrors()탈출");
		joinService.modified(jr);
		logger.debug("main.jsp로 이동");
		return "member/modified_process";
	}
	
}
