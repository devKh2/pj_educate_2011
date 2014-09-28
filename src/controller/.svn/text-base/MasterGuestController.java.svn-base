package controller;

import java.util.ArrayList;
import java.util.List;

import model.EBBS_ArticleListModel;
import model.MBBS_Article;
import model.MBBS_ArticleListModel;
import model.NBBS_ArticleListModel;
import model.SBBS_ArticleListModel;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import service.bbs.ebbs.EBBS_ListService;
import service.bbs.mbbs.MBBS_ListService;
import service.bbs.nbbs.NBBS_ListService;
import service.bbs.sbbs.SBBS_ListService;

@Controller
public class MasterGuestController {
	
	EBBS_ListService ebbs_ListService;
	MBBS_ListService mbbs_ListService;
	SBBS_ListService sbbs_ListService;
	NBBS_ListService nbbs_ListService;
	public void setNbbs_ListService(NBBS_ListService nbbs_ListService) {
		this.nbbs_ListService = nbbs_ListService;
	}

	public void setEbbs_ListService(EBBS_ListService ebbs_ListService) {
		this.ebbs_ListService = ebbs_ListService;
	}
	
	public void setMbbs_ListService(MBBS_ListService mbbs_ListService) {
		this.mbbs_ListService = mbbs_ListService;
	}


	public void setSbbs_ListService(SBBS_ListService sbbs_ListService) {
		this.sbbs_ListService = sbbs_ListService;
	}


	@RequestMapping(value = "master/guest.do", method = RequestMethod.GET)
	public ModelAndView content(
			@RequestParam(value = "type", defaultValue = "mbbs") String type,
			@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
			@RequestParam(value = "searchValue", required = false) String searchValue,
			@RequestParam(value = "searchKey", required = false) String searchKey) {
		
		ModelAndView mav =new ModelAndView("master/guest_list");
		if("mbbs".equals(type)){
			MBBS_ArticleListModel listmodel= mbbs_ListService.getArticleList(pageNum, searchKey, searchValue);
			processingPaging(mav, listmodel, pageNum);
			mav.addObject("listmodel", listmodel);
		}else if("nbbs".equals(type)){
			NBBS_ArticleListModel listmodel= nbbs_ListService.getArticleList(pageNum, searchKey, searchValue);
			mav.addObject("listmodel", listmodel);
		}else if("sbbs".equals(type)){
			SBBS_ArticleListModel listmodel= sbbs_ListService.getArticleList(pageNum, searchKey, searchValue,null);
			mav.addObject("listmodel", listmodel);
		}else if("ebbs".equals(type)){
			EBBS_ArticleListModel listmodel= ebbs_ListService.getArticleList(pageNum, searchKey, searchValue,null);
			mav.addObject("listmodel", listmodel);
		}
		
		mav.addObject("searchValue", searchValue);
		mav.addObject("searchKey", searchKey);
		return mav;
	}
	
	private void processingPaging(ModelAndView mav, 
			MBBS_ArticleListModel listModel, int requestPageNumber){
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
