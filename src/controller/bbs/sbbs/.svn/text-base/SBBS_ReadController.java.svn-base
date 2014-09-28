package controller.bbs.sbbs;

import model.SBBS_Article;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;



import service.ArticleNotFoundException;
import service.bbs.sbbs.SBBS_ReadService;


@Controller
public class SBBS_ReadController {
	static Logger logger = Logger.getLogger(SBBS_ReadController.class);
	
	private SBBS_ReadService sbbs_ReadService;	
	
	public void setSbbs_ReadService(SBBS_ReadService sbbs_ReadService) {
		this.sbbs_ReadService = sbbs_ReadService;
	}



	@RequestMapping("/sbbs_read.do")
	public ModelAndView read(@RequestParam(value="artId") int artId,
							 @RequestParam(value="stnum") int stnum) throws ArticleNotFoundException{
		ModelAndView mav = new ModelAndView("bbs/sbbs_read_view");
		mav.addObject("stnum",stnum);
		SBBS_Article article = sbbs_ReadService.read(artId);
		mav.addObject("article", article);
		return mav;
	}
}
