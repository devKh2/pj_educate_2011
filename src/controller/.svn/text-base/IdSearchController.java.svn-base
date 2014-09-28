package controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import model.MemberListModel;
import service.IdPwSearchService;

@Controller
@RequestMapping("/member_idsearch.do")
public class IdSearchController {

	static Logger logger = Logger.getLogger(IdSearchController.class);
	private IdPwSearchService idpwSearchService;

	public void setIdpwSearchService(IdPwSearchService idpwSearchService) {
		this.idpwSearchService = idpwSearchService;
	}

	@RequestMapping(method = RequestMethod.GET)
	public String form() {
		logger.debug("IdPwSearchController.form():::::::::GET");
		return "member/member_idsearch";
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView search(@RequestParam(value = "name") String name,
			@RequestParam(value = "preResidentNum") String preResidentNum , @RequestParam(value = "tailResidentNum") String tailResidentNum) {
		
		logger.debug("IdPwSearchController ModelAndView의 search메서드 실행");
		ModelAndView mav = new ModelAndView("member/member_idsearch");
		MemberListModel memberlistModel = idpwSearchService.IdSearch(name, preResidentNum, tailResidentNum);
		mav.addObject("memberlistModel", memberlistModel);
		return mav;
	}
}
