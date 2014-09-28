package controller;

import java.util.List;


import mail.MailTransfer;
import model.EmailListModel;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import service.EmailAddrListService;

@Controller
public class MasterCustomerController {

	static Logger logger = Logger.getLogger(MasterCustomerController.class);
	
	private EmailAddrListService emailAddrListService;
	
	
	public void setEmailAddrListService(EmailAddrListService emailAddrListService) {
		this.emailAddrListService = emailAddrListService;
	}

	
	@RequestMapping(value = "master/toCustomEmail.do", method = RequestMethod.GET)
	public String get_toEmail(){
		String view = "/master/toCustomEmail_default";
		return view;
	}
	
	@RequestMapping(value = "master/toCustomEmail.do", method = RequestMethod.POST)
	public ModelAndView post_toEmail(	@RequestParam(value = "title") String title,
										@RequestParam(value = "fromEmail") String fromEmail,
										@RequestParam(value = "content") String content){
		ModelAndView mav = new ModelAndView("/master/toCustomEmail_result");
		
		//보낼 회원주소를 가져오기  (리스트)
		List<EmailListModel> list = emailAddrListService.getCustomEmailAddr();
		
		
		MailTransfer mailTransfer = new MailTransfer(fromEmail, title);
		mailTransfer.MassEmailSend(content, list);  // 메일 전송
		
		logger.debug("메일 전송 완료");	
		return mav;
	}
}
