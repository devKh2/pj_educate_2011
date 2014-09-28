package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import mail.MailTransfer;
import model.EmailListModel;
import model.MemberListModel;
import model.SearchParam;
import model.StoreModel;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import service.EmailAddrListService;
import service.FileService;
import service.IdPwSearchService;
import service.JoinService;
import service.StoreService;
import validator.StoreMenuValidator;

@Controller
public class MasterStoreController {
	
	static Logger logger = Logger.getLogger(MasterStoreController.class);
	
	private StoreService storeService;
	private FileService fileService;
	private EmailAddrListService emailAddrListService;
	private IdPwSearchService idpwSearchService;

	public void setIdpwSearchService(IdPwSearchService idpwSearchService) {
		this.idpwSearchService = idpwSearchService;
	}
	
	public void setStoreService(StoreService storeService) {
		this.storeService = storeService;
	}
	
	public void setFileService(FileService fileService) {
		this.fileService = fileService;
	}
	
	public void setEmailAddrListService(EmailAddrListService emailAddrListService) {
		this.emailAddrListService = emailAddrListService;
	}
	
	@ModelAttribute
	public Object formBackingObject(){
		return new StoreModel();
	}
	
	@RequestMapping(value = "master/idSearch.do", method = RequestMethod.POST)
	public ModelAndView check(@RequestParam(value = "id", defaultValue = "") String id) {
		ModelAndView mav = new ModelAndView();
		MemberListModel list = idpwSearchService.IdSearch(id);

		mav.addObject("memberList", list);
		mav.addObject("id", id);
		mav.setViewName("master/idSearch");
		return mav;
	}
	
	@RequestMapping(value = "master/store.do", method = RequestMethod.GET)
	public ModelAndView content(
			@RequestParam(value = "content", defaultValue = "list") String contentName,
			@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
			@RequestParam(value = "searchValue", required = false) String searchValue,
			@RequestParam(value = "searchKey", required = false) String searchKey){
		ModelAndView mav = new ModelAndView();
		SearchParam params = new SearchParam();
		params.setP(pageNum);
		params.setPage_per_count(5);
		String path = "/master/store_";

		if("list".equals(contentName)){
			try {
				path += "list";
				if(searchValue == null){
					mav.addObject("storeListModel", storeService.getStoreModelList(params));
				}else if(searchValue != null){
					if("0".equals(searchKey)){
						params.setKw(searchValue);
						mav.addObject("storeListModel", storeService.getStoreModelList(params));
					}else{
						params.setSt_type(searchValue);
						mav.addObject("storeListModel", storeService.getStoreModelList(params));
					}
					mav.addObject("searchValue", searchValue);
					mav.addObject("searchKey", searchKey);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else{
			path += "add";
		}
		mav.setViewName(path);
		return mav;
	}
	
	@RequestMapping(value= "master/add_store.do", method = RequestMethod.POST)
	public ModelAndView add(HttpServletRequest request,	@ModelAttribute StoreModel storeModel, BindingResult errors){
		ModelAndView mav = new ModelAndView("redirect:/master/store.do?content=list");
		new StoreMenuValidator().validate(storeModel, errors);
		if(errors.hasErrors()){
			mav.setViewName("/master/store_add");
			return mav;
		}
		int picNum = 0;
		try {
			if(storeModel.getFile().isEmpty()){
				picNum = 0;
			}else{
				picNum = fileService.fileUpload(storeModel.getFile(), "store", request.getSession().getServletContext().getRealPath("images"));
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		storeModel.setSt_picnum(Integer.toString(picNum));
		try {
			storeService.insertStore(storeModel);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return mav;
	}
	
	@RequestMapping(value = "master/update_store.do", method = RequestMethod.POST)
	public ModelAndView update(@RequestParam("st_num") String st_num){
		System.out.println("a");
		StoreModel storeModel = null;
		ModelAndView mav = new ModelAndView("/master/store_add");
		try {
			storeModel = storeService.getStore(Integer.parseInt(st_num));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		mav.addObject("storeModel", storeModel);
		mav.addObject("updateFlag", true);
		
		return mav;
		
	}
	
	@RequestMapping(value = "master/delete_store.do", method = RequestMethod.POST)
	public ModelAndView delete(@RequestParam("st_num") String st_num){
		ModelAndView mav = new ModelAndView("redirect:/master/store.do?content=list");
		try {
			storeService.deleteStore(st_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return mav;
	}
	
	
	//가게회원에게 메일 보내는 컨트롤러
	@RequestMapping(value = "master/toStoreEmail.do", method = RequestMethod.GET)
	public String get_toEmail(){
		String view = "/master/toStoreEmail_default";
		return view;
	}
	
	@RequestMapping(value = "master/toStoreEmail.do", method = RequestMethod.POST)
	public ModelAndView post_toEmail(	@RequestParam(value = "title") String title,
										@RequestParam(value = "fromEmail") String fromEmail,
										@RequestParam(value = "content") String content){
		ModelAndView mav = new ModelAndView("/master/toStoreEmail_result");
		
		//보낼 회원주소를 가져오기  (리스트)
		List<EmailListModel> list = emailAddrListService.getStoreEmailAddr();
		
		
		MailTransfer mailTransfer = new MailTransfer(fromEmail, title);
		mailTransfer.MassEmailSend(content, list);  // 메일 전송
		
		logger.debug("메일 전송 완료");	
		return mav;
	}
}
