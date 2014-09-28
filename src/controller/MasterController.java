package controller;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import model.Admin;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import encryption.SecurityUtil;

import service.MasterService;
import validator.AdminValidator;

@Controller
public class MasterController {

	static Logger logger = Logger.getLogger(MasterController.class);
	
	MasterService masterService;
	public void setMasterService(MasterService masterService) {
		this.masterService = masterService;
	}
	
	@ModelAttribute
	public Object formBackingObject(){
		return new Admin();
	}
	
	/*
	 * main 페이지 접속 controller
	 */
	@RequestMapping(value="master/main.do",method=RequestMethod.GET)
	public ModelAndView main(HttpSession session ,@RequestParam(value = "page_name", required = false ) String pageName
			){
		ModelAndView mav = new ModelAndView("/master/main");
		if(session.getAttribute("member") == null){
			mav.setViewName("redirect:/main.do");
			return mav;
		}
		// pageName은 관리자페이지의 top메뉴값
		if(pageName != null){
			mav.addObject("page_name", pageName);
		}
		return mav;
	}
	
	/*
	 * left page의 submenu controller
	 */
	@RequestMapping(value="master/submenu.do",method=RequestMethod.GET)
	public ModelAndView submenu(@RequestParam(value = "page", required = false ) String pageName){
		ModelAndView mav = new ModelAndView();
		String path = "/master/";
		if(pageName != null){
			path += pageName + "_submenu";
		}
		logger.debug("!!!!!!!!경로는 : " + path);
		mav.setViewName(path);
		return mav;
	}
	
	
	/*
	 * 중심이 되는 main page(기본정보) 에 controller
	 */
	@RequestMapping(value="master/content.do",method=RequestMethod.GET)
	public ModelAndView content(
			@RequestParam(value = "content", required = false ) String contentName
			){
		ModelAndView mav = new ModelAndView();
		String path = "/master/adm_";
		
		if ("list".equals(contentName)) {
			try {
				path += "list";
				mav.addObject("admin", masterService.getAdmin());
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if("reset".equals(contentName)){
			path += "reset";
		}
		
		mav.setViewName(path);
		return mav;
	}
	
	@RequestMapping(value="master/update_admin.do",method=RequestMethod.POST)
	public ModelAndView update(@ModelAttribute Admin admin, BindingResult errors){
		ModelAndView mav = new ModelAndView("/master/adm_list");
		new AdminValidator().validate(admin, errors);
		if(errors.hasErrors()){
			return mav;
		}
		if(admin.getPw() != null){
			try {
				admin.setPw(SecurityUtil.getCryptoMD5String(admin.getPw()));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		try {
			masterService.update(admin);
			mav.addObject("admin", masterService.getAdmin());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mav;
	}
}
