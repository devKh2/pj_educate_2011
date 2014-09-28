package controller;

import java.sql.SQLException;
import java.util.ArrayList;

import model.Banner;
import model.MBBS_Article;
import model.MBBS_ArticleListModel;
import model.MenuModel;
import model.Random4_EBBS;
import model.SearchParam;
import model.StoreModel;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.BannerService;
import service.MenuService;
import service.StoreService;
import service.bbs.ebbs.EBBS_ListService;
import service.bbs.mbbs.MBBS_ListService;


@Controller
public class MainContentController {
	static Logger logger = Logger.getLogger(MainContentController.class);
	
	
	private StoreService storeService;
	private MenuService menuService;
	private BannerService bannerService;
	private EBBS_ListService ebbs_listService;
	private MBBS_ListService mbbs_listService;
	


	public void setMbbs_listService(MBBS_ListService mbbs_listService) {
		this.mbbs_listService = mbbs_listService;
	}


	public void setEbbs_listService(EBBS_ListService ebbs_listService) {
		this.ebbs_listService = ebbs_listService;
	}


	public void setBannerService(BannerService bannerService) {
		this.bannerService = bannerService;
	}
	

	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}

	public void setStoreService(StoreService storeService) {
		this.storeService = storeService;
	}
	
	@RequestMapping("/mainContents.do")
	public ModelAndView result() throws SQLException{
		ModelAndView mav = new ModelAndView("/main/mainContents");
		dilNewsResult(mav);
		dilTop5Result(mav);
		bannerResult(mav);
		dilRecommStoreResult(mav);
		qnaResult(mav);
		storeMapResult(mav);
		return mav;
	}
	
	
	/**
	 * 배달가 소식  - 배달맛집/ 배달요리 (랜덤으로 6개 가져오기)
	 * @param mav
	 * @throws SQLException
	 */
	public void dilNewsResult(ModelAndView mav) throws SQLException{
		ArrayList<StoreModel> randomStoreList = storeService.getRandomStoreList();
		ArrayList<MenuModel> randomMenuList = menuService.getRandomMenuList();
		mav.addObject("randomStoreList", randomStoreList);
		mav.addObject("randomMenuList", randomMenuList);
	}
	
	
	/**
	 * 인기 Top5 - 배달맛집/ 배달요리
	 * @param mav
	 * @return
	 * @throws SQLException
	 */
	public void dilTop5Result(ModelAndView mav) throws SQLException{
		ArrayList<StoreModel> topStoreList = storeService.getTopStoreList();
		ArrayList<MenuModel> topMenuList = menuService.getTopMenuList();
		mav.addObject("topStoreList", topStoreList);
		mav.addObject("topMenuList", topMenuList);
	}	
	
	/**
	 * 오늘의 추천! - 맛집그림 / 추천 게시글 
	 * @param mav
	 * @param searParam
	 * @return
	 * @throws SQLException
	 */
	public void dilRecommStoreResult(ModelAndView mav) throws SQLException{
		ArrayList<Random4_EBBS>  randombbsList = ebbs_listService.get_4list();
		mav.addObject("randombbsList", randombbsList);
	}
	
	
	/**
	 * 배달맛집 QnA - QnA 게시글 
	 * @param mav
	 * @param searParam
	 * @return
	 * @throws SQLException
	 */
	public void qnaResult(ModelAndView mav) throws SQLException{
		ArrayList<MBBS_Article>  randomQnAList = mbbs_listService.random_3_List();
		for(MBBS_Article list: randomQnAList){
			System.out.println("큐앤에이");
			System.out.println(list);
		}
		mav.addObject("randomQnAList", randomQnAList);
	}
	

	/**
	 * 배너 - 등록된 배너(저장위치주소)
	 * @param mav
	 * @param searParam
	 * @return
	 * @throws SQLException
	 */
	public ModelAndView bannerResult(ModelAndView mav) throws SQLException{
	
		Banner centerBanner = bannerService.presentBanner1();
		Banner rightBanner = bannerService.presentBanner2();
		
		mav.addObject("centerBanner", centerBanner);
		mav.addObject("rightBanner", rightBanner);
		
		return mav;
	}
	
	
	/**
	 * 배달 맛집 지도
	 * @param mav
	 * @param searParam
	 * @return
	 * @throws SQLException
	 */
	public ModelAndView storeMapResult(ModelAndView mav) throws SQLException{
		mav.addObject("storeMap","storeMap.do"); 
		return mav;
	}
	@RequestMapping("/storeMap.do")
	public ModelAndView  storeMapCall() throws SQLException{
		ModelAndView mav=new ModelAndView("main/storeMap");
		ArrayList<StoreModel> randomStoreList = storeService.getRandomStoreList();
		System.out.println(randomStoreList.get(0).getSt_detailaddr());
		mav.addObject("randomStoreList", randomStoreList);
		return mav;
	}
	
	
	
}
