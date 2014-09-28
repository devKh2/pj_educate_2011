package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import service.JoinService;

@Controller
public class IDController {
	private JoinService joinService;

	public void setJoinService(JoinService joinService) {
		this.joinService = joinService;
	}

	
	@RequestMapping(value = "/id_check.do")
	public ModelAndView check(@RequestParam(value = "userID") String id) {
		ModelAndView mav = new ModelAndView();

		boolean result = joinService.isExist(id);

		mav.addObject("result", result);
		mav.setViewName("member/id_check_i");
		return mav;
	}
}
