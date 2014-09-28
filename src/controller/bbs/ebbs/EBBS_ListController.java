package controller.bbs.ebbs;



import java.util.List;

import model.EBBS_ArticleListModel;
import model.Random4_EBBS;
import service.bbs.ebbs.*;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class EBBS_ListController {

	static Logger logger = Logger.getLogger(EBBS_ListController.class);
	private EBBS_ListService ebbs_listService;	 
	
	public void setEbbs_listService(EBBS_ListService ebbs_listService) {
		this.ebbs_listService = ebbs_listService;
	}
	
	
	@RequestMapping("/ebbs_list.do")
	public ModelAndView list(@RequestParam(value="p", defaultValue="1") int requestPageNumber,
							@RequestParam(value="searchkind",defaultValue="") String searchkind,
							@RequestParam(value="search",defaultValue="") String search,
							@RequestParam(value="stnum",defaultValue="1") String stnum){
		System.out.println("이비비에스 안에!");
		logger.debug("ListController.list()");
		ModelAndView mav = new ModelAndView("bbs/ebbs_list_view");
		System.out.println("이비비에스 안에!");
		EBBS_ArticleListModel listModel = ebbs_listService.getArticleList(requestPageNumber, searchkind, search,stnum);
		
		//페이징처리
		processingPaging(mav, listModel, requestPageNumber);		
		
		//list_view로 listModel을 parameter 로 넘김 
		mav.addObject("listModel",listModel);	
		mav.addObject("stnum",stnum);
		return mav;
	}
	
	private void processingPaging(ModelAndView mav, 
			EBBS_ArticleListModel listModel, int requestPageNumber){
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
					    		 EBBS_ListService.COUNT_PER_PAGE);
		
		//list_view로 rownum 을 parameter 로 넘김 
		mav.addObject("rownum", rownum);
	}
}
