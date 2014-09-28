package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import model.Banner;
import model.BannerListModel;
import model.Popup;
import model.PopupListModel;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import service.BannerService;
import service.FileService;
import service.PopupService;

@Controller
public class Popup_BannerController {

	static Logger logger = Logger.getLogger(MasterSaleController.class);
	private PopupService popupService;
	private FileService fileService;
	private BannerService bannerService;
	

	public void setBannerService(BannerService bannerService) {
		this.bannerService = bannerService;
	}

	public void setPopupService(PopupService popupService) {
		this.popupService = popupService;
	}

	public void setFileService(FileService fileService) {
		this.fileService = fileService;
	}
		
	@ModelAttribute
	public Object formBackingObject(){
		return new Popup();
	}
	
	@RequestMapping(value = "master/popup_TimeCheck.do")
	public ModelAndView popup_TimeCheck(	@RequestParam(value = "title") String title,
											@RequestParam(value = "position") String position,
											@RequestParam(value = "startYear") int startYear,
											@RequestParam(value = "startMonth") int startMonth,
											@RequestParam(value = "startDay") int startDay,
											@RequestParam(value = "startHour") int startHour,
											@RequestParam(value = "startMin") int startMin,
											@RequestParam(value = "endYear") int endYear,
											@RequestParam(value = "endMonth") int endMonth,
											@RequestParam(value = "endDay") int endDay,
											@RequestParam(value = "endHour") int endHour,
											@RequestParam(value = "endMin") int endMin,
											@RequestParam(value = "linkAddr") String linkAddr) throws SQLException{
		
		ModelAndView mav = new ModelAndView();
		Timestamp sd = new Timestamp(startYear + 100, startMonth - 1, startDay, startHour, startMin, 0, 0);

		Timestamp ed = new Timestamp(endYear + 100, endMonth - 1, endDay, endHour, endMin, 0, 0);
		
		Popup popup = new Popup();
		popup.setSd(sd);
		popup.setEd(ed);
		popup.setPop_position(position);
		popup.setPop_linkAddr(linkAddr);
		boolean result = popupService.isExist(popup);
		mav.addObject("result", result);
		mav.setViewName("master/time_check_i");
		return mav;
	}
	
	@RequestMapping(value = "master/banner_TimeCheck.do")
	public ModelAndView banner_TimeCheck(	@RequestParam(value = "title") String title,
											@RequestParam(value = "position") String position,
											@RequestParam(value = "startYear") int startYear,
											@RequestParam(value = "startMonth") int startMonth,
											@RequestParam(value = "startDay") int startDay,
											@RequestParam(value = "startHour") int startHour,
											@RequestParam(value = "startMin") int startMin,
											@RequestParam(value = "endYear") int endYear,
											@RequestParam(value = "endMonth") int endMonth,
											@RequestParam(value = "endDay") int endDay,
											@RequestParam(value = "endHour") int endHour,
											@RequestParam(value = "endMin") int endMin) throws SQLException{
		
		ModelAndView mav = new ModelAndView();
		Timestamp sd = new Timestamp(startYear + 100, startMonth - 1, startDay, startHour, startMin, 0, 0);

		Timestamp ed = new Timestamp(endYear + 100, endMonth - 1, endDay, endHour, endMin, 0, 0);
		
		Banner banner = new Banner();
		banner.setSd(sd);
		banner.setEd(ed);
		banner.setBan_position(position);
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		boolean result = bannerService.isExist(banner);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		mav.addObject("result", result);
		mav.setViewName("master/time_check_i");
		return mav;
	}
	
	//관리자페이지 팝업게시판
	@RequestMapping(value = "master/popup.do")
	public ModelAndView getPopupList(	@RequestParam(value = "p", defaultValue = "1") int requestPageNumber,
			 							@RequestParam(value = "search", defaultValue = "") String search) throws Exception{
		ModelAndView mav = new ModelAndView("/master/popup_default");

		PopupListModel listModel = popupService.getPopupList(requestPageNumber, search);
		
		processingPaging(mav, listModel, requestPageNumber);
		popupService.updatePopupList();
		mav.addObject("listModel", listModel);		
		return mav;
	}
	
	private void processingPaging(ModelAndView mav, PopupListModel listModel, int requestPageNumber) {
		if (listModel.getTotalPageCount() > 0) {
			int beginPageNumber = (listModel.getRequestPage() - 1) / 10 * 10 + 1;
			int endPageNumber = beginPageNumber + 9;
			if (endPageNumber > listModel.getTotalPageCount()) {
				endPageNumber = listModel.getTotalPageCount();
			}
			mav.addObject("beginPage", beginPageNumber);
			mav.addObject("endPage", endPageNumber);
		}
		int rownum = listModel.getTotalArticleCount() - ((requestPageNumber - 1) * popupService.COUNT_PER_PAGE);
		mav.addObject("rownum", rownum);
	}
	
	
	
	@RequestMapping(value = "master/popup_regist.do",method = RequestMethod.POST)
	public ModelAndView postPopup_regist(	@RequestParam(value = "title") String title,
											@RequestParam(value = "position") String position,
											@RequestParam(value = "startYear") String startYear,
											@RequestParam(value = "startMonth") String startMonth,
											@RequestParam(value = "startDay") String startDay,
											@RequestParam(value = "startHour") String startHour,
											@RequestParam(value = "startMin") String startMin,
											@RequestParam(value = "endYear") String endYear,
											@RequestParam(value = "endMonth") String endMonth,
											@RequestParam(value = "endDay") String endDay,
											@RequestParam(value = "endHour") String endHour,
											@RequestParam(value = "endMin") String endMin,
											@RequestParam(value = "file") MultipartFile file,
											@RequestParam(value = "linkAddr") String linkAddr,
											HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView("redirect:/master/popup.do");
		String startDate = startYear + "/" + startMonth + "/" + startDay + " " + startHour + ":" + startMin;
		String endDate = endYear + "/" + endMonth + "/" + endDay + " " + endHour +  ":" + endMin;
		System.out.println("######################");
		
		Popup popup = new Popup();
		popup.setFile(file);
		popup.setPop_position(position);
		popup.setPop_title(title);
		popup.setPop_startDate(startDate);
		popup.setPop_endDate(endDate);
		popup.setPop_linkAddr(linkAddr);
		int picNum = 0;
		try {
			System.out.println("???????????");
			if(popup.getFile().isEmpty()){
				System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%");
				picNum = 0;
			}else{
				System.out.println("!!!!!!!!!!!!!!!!!!!!!!!");
				picNum = fileService.fileUpload(popup.getFile(), "popup", request.getSession().getServletContext().getRealPath("images"));
				System.out.println("@@@@@@@@@@@@@@@@@@@");
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}


		popup.setPop_picNum(Integer.toString(picNum));
		
		try {
			popupService.insertPopup(popup);
			popupService.updatePopupList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@RequestMapping(value = "master/popup_delete.do")
	public String popup_delete(@RequestParam(value = "pop_artid", defaultValue = "1") int pop_artid){
		System.out.println("삭제 pop_artid   " + pop_artid);
		popupService.deletePopup(pop_artid);
		return "redirect:/master/popup.do";
	}
	
	
	@RequestMapping(value = "master/banner.do")
	public ModelAndView getBannerList(	@RequestParam(value = "p", defaultValue = "1") int requestPageNumber,
										@RequestParam(value = "search", defaultValue = "") String search) throws Exception{
		ModelAndView mav = new ModelAndView("/master/banner_default");

		BannerListModel listModel = bannerService.getBannerList(requestPageNumber, search);
		
		bannerProcessingPaging(mav, listModel, requestPageNumber);
		bannerService.updateBannerList();
		mav.addObject("listModel", listModel);		
		return mav;
	}	

	private void bannerProcessingPaging(ModelAndView mav, BannerListModel listModel, int requestPageNumber) {
		if (listModel.getTotalPageCount() > 0) {
			int beginPageNumber = (listModel.getRequestPage() - 1) / 10 * 10 + 1;
			int endPageNumber = beginPageNumber + 9;
			if (endPageNumber > listModel.getTotalPageCount()) {
				endPageNumber = listModel.getTotalPageCount();
			}
			mav.addObject("beginPage", beginPageNumber);
			mav.addObject("endPage", endPageNumber);
		}
		int rownum = listModel.getTotalBannerCount() - ((requestPageNumber - 1) * bannerService.COUNT_PER_PAGE);
		mav.addObject("rownum", rownum);
	}
	



	@RequestMapping(value = "master/banner_regist.do",method = RequestMethod.POST)
	public ModelAndView postBanner_regist(	@RequestParam(value = "title") String title,
											@RequestParam(value = "position") String position,
											@RequestParam(value = "startYear") String startYear,
											@RequestParam(value = "startMonth") String startMonth,
											@RequestParam(value = "startDay") String startDay,
											@RequestParam(value = "startHour") String startHour,
											@RequestParam(value = "startMin") String startMin,
											@RequestParam(value = "endYear") String endYear,
											@RequestParam(value = "endMonth") String endMonth,
											@RequestParam(value = "endDay") String endDay,
											@RequestParam(value = "endHour") String endHour,
											@RequestParam(value = "endMin") String endMin,
											@RequestParam(value = "file") MultipartFile file,
											@RequestParam(value = "linkAddr") String linkAddr,
											HttpServletRequest request){
		ModelAndView mav = new ModelAndView("redirect:/master/banner.do");
		String startDate = startYear + "/" + startMonth + "/" + startDay + " " + startHour + ":" + startMin;
		String endDate = endYear + "/" + endMonth + "/" + endDay + " " + endHour +  ":" + endMin;
		System.out.println("######################");
		Banner banner = new Banner();
		
		banner.setFile(file);
		banner.setBan_title(title);
		banner.setBan_position(position);
		banner.setBan_startDate(startDate);
		banner.setBan_endDate(endDate);
		banner.setBan_linkAddr(linkAddr);
		
		int picNum = 0;
		try {
			System.out.println("???????????");
			if(banner.getFile().isEmpty()){
				System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%");
				picNum = 0;
			}else{
				System.out.println("!!!!!!!!!!!!!!!!!!!!!!!");
				picNum = fileService.fileUpload(banner.getFile(), "banner", request.getSession().getServletContext().getRealPath("images"));
				System.out.println("@@@@@@@@@@@@@@@@@@@");
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		banner.setBan_picNum(Integer.toString(picNum));
		
		bannerService.insertBanner(banner);
		
		System.out.println("bannerService.updateBannerList()실행");
		
		bannerService.updateBannerList();
		return mav;
	}
	
	
	@RequestMapping(value = "master/picExpand.do")
	public ModelAndView picExpand(@RequestParam(value = "picPath") String picPath){
		ModelAndView mav = new ModelAndView("/master/picExpand");
		mav.addObject("picPath", picPath);
		return mav;
	}
	
	@RequestMapping(value = "picExpand.do")
	public ModelAndView mainPicExpand(	@RequestParam(value = "picPath") String picPath,
										@RequestParam(value = "linkAddr") String linkAddr){
		ModelAndView mav = new ModelAndView("/master/popup");
		mav.addObject("picPath", picPath);
		mav.addObject("linkAddr", linkAddr);
		return mav;
	}
	
	/*
	//배너 호출
	@RequestMapping(value = "getMainBanner1.do")
	public ModelAndView getMainBanner1() throws SQLException{
		ModelAndView mav = new ModelAndView("/main/banner1");
		Banner banner1 = bannerService.presentBanner1();			//사진 경로 저장
		mav.addObject("banner1", banner1);							//사진 경로 보냄
		return mav;
	}
	
	@RequestMapping(value = "getMainBanner2.do")
	public ModelAndView getMainBanner2() throws SQLException{
		ModelAndView mav = new ModelAndView("/main/banner2");
		Banner banner2 = bannerService.presentBanner2();
		mav.addObject("banner1", banner2);
		return mav;
	}
	*/
}