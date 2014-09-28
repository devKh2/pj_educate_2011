package controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PopupController {

	
	@RequestMapping(value = "popup.do")
	public ModelAndView getPopup(){
		
		ModelAndView mav = new ModelAndView("/master/popup");
		return mav;
	}
}
