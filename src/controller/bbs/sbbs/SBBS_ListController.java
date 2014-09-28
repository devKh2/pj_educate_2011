package controller.bbs.sbbs;



import model.SBBS_ArticleListModel;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import service.bbs.mbbs.MBBS_ListService;
import service.bbs.sbbs.SBBS_ListService;



@Controller
public class SBBS_ListController {

	static Logger logger = Logger.getLogger(SBBS_ListController.class);
	private SBBS_ListService sbbs_listService;	 
	
	public void setSbbs_listService(SBBS_ListService sbbs_listService) {
		this.sbbs_listService = sbbs_listService;
	}
	
	
	@RequestMapping("/sbbs_list.do")
	public ModelAndView list(@RequestParam(value="p", defaultValue="1") int requestPageNumber,
							@RequestParam(value="searchkind",defaultValue="total_search") String searchkind,
							@RequestParam(value="search",defaultValue="") String search,
							@RequestParam(value="stnum",defaultValue="false") String stnum){
		
		logger.debug("ListController.list()");
		ModelAndView mav = new ModelAndView("bbs/sbbs_list_view");
		
		
		SBBS_ArticleListModel listModel = sbbs_listService.getArticleList(requestPageNumber, searchkind, search,stnum);
		
		//페이징처리
		processingPaging(mav, listModel, requestPageNumber);		
		
		//list_view로 listModel을 parameter 로 넘김 
		mav.addObject("listModel",listModel);	
		mav.addObject("stnum",stnum);
		return mav;
	}
	
	private void processingPaging(ModelAndView mav, 
			SBBS_ArticleListModel listModel, int requestPageNumber){
		if (listModel.getTotalPageCount() > 0) {
			int beginPageNumber 
				= (listModel.getRequestPage() - 1) / 10 * 10 + 1;
			int endPageNumber = beginPageNumber + 9;
			if (endPageNumber > listModel.getTotalPageCount()) {
				endPageNumber = listModel.getTotalPageCount();
			}
			
			//list_view로 beginPage를 parameter 로 넘김 
			//list_view로 endPage를 parameter 로 넘김 
			mav.addObject("beginPage", beginPageNumber);
			mav.addObject("endPage", endPageNumber);
		}
		//시작 번호 = 총게시물 수 - ((현재페이지-1) * 페이지당 게시물 수)
		int rownum = listModel.getTotalArticleCount() - 
					     ((requestPageNumber - 1) * 
					    		 MBBS_ListService.COUNT_PER_PAGE);
		
		//list_view로 rownum 을 parameter 로 넘김 
		mav.addObject("rownum", rownum);
	}
}
