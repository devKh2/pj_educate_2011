package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import model.MenuModel;
import model.SearchParam;
import model.StoreListModel;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import service.FileService;
import service.MenuService;
import service.StoreService;
import validator.MasterMenuValidator;

@Controller
public class MasterMenuController {
	private StoreService storeService;
	private MenuService menuService;
	private FileService fileService;

	public void setFileService(FileService fileService) {
		this.fileService = fileService;
	}

	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}

	public void setStoreService(StoreService storeService) {
		this.storeService = storeService;
	}
	
	@ModelAttribute
	public Object formBackingObject(){
		return new MenuModel();
	}

	
	/*
	 * 메뉴 관리 메뉴의 모든 page를 관리 하는 controller
	 */
	@RequestMapping(value = "master/menu.do", method = RequestMethod.GET)
	public ModelAndView content(
			@RequestParam(value = "content", defaultValue = "list") String contentName,
			@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
			@RequestParam(value = "searchValue", required = false) String searchValue,
			@RequestParam(value = "searchKey", required = false) String searchKey) {
		ModelAndView mav = new ModelAndView();
		SearchParam params = new SearchParam();
		params.setPage_per_count(5);
		params.setP(pageNum);
		params.setKw(searchValue);
		String path = "/master/menu_";
		if ("list".equals(contentName)) {
			try {
				path += "list";
				if(searchValue == null){
					mav.addObject("menuListModel", menuService.getMenuModelList_s(pageNum, ""));
				}else if(searchValue != null){
					if("1".equals(searchKey)){
						mav.addObject("menuListModel", menuService.getMenuModelList(params));
					}else{
						mav.addObject("menuListModel", menuService.getMenuModelList_s(pageNum, searchValue));
					}
					mav.addObject("searchValue", searchValue);
					mav.addObject("searchKey", searchKey);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if("add".equals(contentName)){
			path += "add";
		}
		
		mav.setViewName(path);
		return mav;
	}
	
	
	/*
	 * 메뉴 등록 controller
	 * 그림 파일 등록과 메뉴 등록을 관리
	 */
	@RequestMapping(value= "master/add_ack.do", method = RequestMethod.POST)
	public ModelAndView add(HttpServletRequest request,	@ModelAttribute MenuModel menuModel, BindingResult errors){
		ModelAndView mav = new ModelAndView("redirect:/master/menu.do?content=list");
		new MasterMenuValidator().validate(menuModel, errors);
		if(errors.hasErrors()){
			mav.setViewName("/master/menu_add");
			return mav;
		}
		int picNum = 0;
		try {
			if(menuModel.getFile().isEmpty()){
				picNum = 0;
			}else{
				picNum = fileService.fileUpload(menuModel.getFile(), "menu", request.getSession().getServletContext().getRealPath("images"));
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		menuModel.setMenu_picnum(Integer.toString(picNum));
		try {
			menuService.insertMenu(menuModel);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return mav;
	}
	
	/*
	 * 메뉴 삭제 controller
	 */
	@RequestMapping(value = "master/delete.do", method = RequestMethod.POST)
	public ModelAndView delete(@RequestParam("st_num") String st_num,
						@RequestParam("menu_name") String menu_name){
		ModelAndView mav = new ModelAndView("redirect:/master/menu.do?content=list");
		try {
			menuService.deleteMenu(menu_name, st_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return mav;
		
	}
	
	/*
	 * 메뉴 수정 controller
	 */
	@RequestMapping(value = "master/update.do", method = RequestMethod.POST)
	public ModelAndView update(@RequestParam("st_num") String st_num,
						@RequestParam("menu_num") String menu_num){
		MenuModel menuModel = null;
		ModelAndView mav = new ModelAndView("/master/menu_add");
		try {
			menuModel = menuService.getMenuOne(menu_num, st_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		mav.addObject("menuModel", menuModel);
		mav.addObject("updateFlag", true);
		
		return mav;
		
	}
	
	/*
	 * 상호 검색 기능을 관리하는 controller
	 */
	@RequestMapping(value = "master/stName.do", method = RequestMethod.POST)
	public ModelAndView stName(@ModelAttribute MenuModel menuModel){
		
		ModelAndView mav = new ModelAndView("/master/stNameCheck");
		SearchParam param = new SearchParam();
		param.setKw(menuModel.getSt_name());
		if(menuModel.getSt_name() != null){
			StoreListModel list = null;
			try {
				list = storeService.getStoreModelList(param);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			mav.addObject("storeList", list);
			mav.addObject("stName", menuModel.getSt_name());
		}
		mav.addObject("menuModel", menuModel);
		return mav;
	}
}
