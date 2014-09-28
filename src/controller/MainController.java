package controller;

import java.sql.SQLException;

import model.Banner;
import model.Popup;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.BannerService;
import service.PopupService;

@Controller
public class MainController {
	
	static Logger logger = Logger.getLogger(MainController.class);
	
	private BannerService bannerService;
	private PopupService popupService;
	
	public void setPopupService(PopupService popupService) {
		this.popupService = popupService;
	}

	public void setBannerService(BannerService bannerService) {
		this.bannerService = bannerService;
	}

	
	@RequestMapping(value= "/main.do")
	public ModelAndView getBanner() throws Exception{
		
		ModelAndView mav = new ModelAndView("main/main");
		
		popupService.updatePopupList();
		bannerService.updateBannerList();
		
		Popup firstPopup = popupService.prisentPopup1();		
		Popup secondPopup = popupService.prisentPopup2();
		
		Banner centerBanner = bannerService.presentBanner1();
		Banner rightBanner = bannerService.presentBanner2();

		mav.addObject("firstPopup", firstPopup);
		mav.addObject("secondPopup", secondPopup);
		
		mav.addObject("centerBanner", centerBanner);
		mav.addObject("rightBanner", rightBanner);
		return mav;
	}
}
