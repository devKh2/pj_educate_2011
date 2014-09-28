package controller.bbs.nbbs;

import model.NBBS_Article;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import service.ArticleNotFoundException;
import service.bbs.nbbs.NBBS_ReadService;

@Controller
public class NBBS_ReadController {
	static Logger logger = Logger.getLogger(NBBS_ReadController.class);
	
	private NBBS_ReadService nbbs_ReadService;	
	
	public void setNbbs_ReadService(NBBS_ReadService nbbs_ReadService) {
		this.nbbs_ReadService = nbbs_ReadService;
	}



	@RequestMapping("/nbbs_read.do")
	public ModelAndView read(@RequestParam(value="artId") int artId) throws ArticleNotFoundException{
		ModelAndView mav = new ModelAndView("bbs/nbbs_read_view");
		NBBS_Article article = nbbs_ReadService.read(artId);
		mav.addObject("article", article);
		return mav;
	}
}
