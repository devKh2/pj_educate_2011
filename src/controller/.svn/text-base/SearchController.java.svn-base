package controller;



import java.sql.SQLException;

import model.MBBS_ArticleListModel;
import model.MenuListModel;
import model.SearchParam;
import model.StoreListModel;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;




import service.MenuService;
import service.StoreService;
import service.bbs.mbbs.MBBS_ListService;


@Controller
public class SearchController {
	static Logger logger = Logger.getLogger(SearchController.class);

	private StoreService storeService;
	private MenuService menuService;
	private MBBS_ListService mbbs_listService;
	

	public void setMbbs_listService(MBBS_ListService mbbs_listService) {
		this.mbbs_listService = mbbs_listService;
	}

	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}

	public void setStoreService(StoreService storeService) {
		this.storeService = storeService;
	}
	
	
	@ModelAttribute
	protected SearchParam formBackingObject() throws Exception {
		return new SearchParam();
	}
	
	
	/**
	 * 검색 결과 (search_result) 페이지 에서 더보기 클릭 시.
	 * @param searParam
	 * @return
	 * @throws SQLException
	 */
	@RequestMapping(value= "/search.do", method=RequestMethod.GET)
	public ModelAndView get(@ModelAttribute SearchParam searParam) throws SQLException{
		ModelAndView mav = new ModelAndView("/search/search_result_detail");
		searchResult(mav, searParam);
		mav.addObject("detail", searParam.getDetail());
		return mav;
	
	}
	
	
	/**
	 * 검색엔진을 통한 검색 시.
	 * @param searParam
	 * @return
	 * @throws SQLException
	 */
	@RequestMapping(value= "/search.do", method=RequestMethod.POST)
	public ModelAndView post(@ModelAttribute SearchParam searParam) throws SQLException{
		ModelAndView mav = new ModelAndView("/search/search_result");
		searchResult(mav, searParam);
		return mav;
	}
	
	
	/**
	 * 검색 결과 리스트 가져오기.
	 * @param mav
	 * @param searParam
	 * @return
	 * @throws SQLException
	 */
	public ModelAndView searchResult(ModelAndView mav, SearchParam searParam) throws SQLException{
		
		StoreListModel storeListModel = null;
		MenuListModel menuListModel = null;
		MBBS_ArticleListModel mbbs_articleListModel = null;
		
		if("all".equals(searParam.getSc())){
			storeListModel = storeService.getStoreModelList(searParam);
			menuListModel = menuService.getMenuModelList(searParam);
			mbbs_articleListModel = mbbs_listService.getSearchArticleList(searParam);
			mav.addObject("storelistModel", storeListModel);
			mav.addObject("menulistModel", menuListModel);
			mav.addObject("mbbs_articleListModel", mbbs_articleListModel);
			mav.addObject("searchSect", searParam.getKw());
			
		}else if("cook".equals(searParam.getSc())){
			menuListModel = menuService.getMenuModelList(searParam);
			mav.addObject("menulistModel", menuListModel);
			mav.setViewName("/search/search_result_detail");
			mav.addObject("searchSect", searParam.getKw());
			searParam.setDetail("요리");
			
		}
		mav.addObject("searParam", searParam);
		mav.addObject("pageNumber", searParam.getP());
		return mav;
		
	}

	
	/**
	 * 검색 메뉴 바에서 업종별 검색 클릭 시.	
	 * @param searParam
	 * @return
	 * @throws SQLException
	 */
	@RequestMapping(value= "/search_st.do", method=RequestMethod.GET)
	public ModelAndView searchStoreT(@ModelAttribute SearchParam searParam) throws SQLException{
		ModelAndView mav = new ModelAndView("/search/search_result_detail");
		searchStore(mav, searParam);
		searParam.setSc("all");
		mav.addObject("searParam", searParam);
		return mav;
	
	}	
	
	/**
	 * 검색결과 가게 리스트 가져오기.
	 * @param mav
	 * @param searParam
	 * @return
	 * @throws SQLException
	 */
	private ModelAndView searchStore(ModelAndView mav, SearchParam searParam) throws SQLException {
		StoreListModel storeListModel = null;
		storeListModel = storeService.getStoreModelList(searParam);
		mav.addObject("totalStoreCount", storeListModel.getTotalStoreCount());
		mav.addObject("storelistModel", storeListModel);
		mav.addObject("pageNumber", searParam.getP());
		mav.addObject("searchSect", searParam.getSt_type());
		return mav;
		
	}

	/**
	 * 검색 메뉴 바에서 메뉴별 검색 클릭 시.	
	 * @param searParam
	 * @return
	 * @throws SQLException
	 */
	@RequestMapping(value= "/search_me.do", method=RequestMethod.GET)
	public ModelAndView searchMenuT(@ModelAttribute SearchParam searParam) throws SQLException{
		ModelAndView mav = new ModelAndView("/search/search_result_detail");
		searchMenu(mav, searParam);
		
		mav.addObject("detail", searParam.getDetail());
		searParam.setSc("all");
		mav.addObject("searParam", searParam);
		return mav;
	
	}
	
	
	/**
	 * 검색결과 가게 리스트 가져오기.
	 * @param mav
	 * @param searParam
	 * @return
	 * @throws SQLException
	 */
	private ModelAndView searchMenu(ModelAndView mav, SearchParam searParam) throws SQLException {
		StoreListModel storeListModel = null;
		storeListModel = storeService.getStoreModelList(searParam);
		mav.addObject("totalStoreCount", storeListModel.getTotalStoreCount());
		mav.addObject("storelistModel", storeListModel);
		mav.addObject("pageNumber", searParam.getP());
		mav.addObject("searchSect", searParam.getMenu_sect());
		return mav;
	}
	
}
