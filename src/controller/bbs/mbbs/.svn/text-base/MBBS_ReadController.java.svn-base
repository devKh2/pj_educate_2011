package controller.bbs.mbbs;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import model.MBBS_Article;
import service.ArticleNotFoundException;
import service.bbs.mbbs.MBBS_ReadService;

@Controller
public class MBBS_ReadController {
	static Logger logger = Logger.getLogger(MBBS_ReadController.class);
	
	private MBBS_ReadService mbbs_ReadService;	
	
	public void setMbbs_ReadService(MBBS_ReadService mbbs_ReadService) {
		this.mbbs_ReadService = mbbs_ReadService;
	}



	@RequestMapping("/mbbs_read.do")
	public ModelAndView read(@RequestParam(value="artId") int artId) throws ArticleNotFoundException{
		ModelAndView mav = new ModelAndView("bbs/mbbs_read_view");
		MBBS_Article article = mbbs_ReadService.read(artId);
		mav.addObject("article", article);
		return mav;
	}
}
