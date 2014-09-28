package controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import encryption.SecurityUtil;
import model.JoinRequest;
import service.JoinService;
import validator.JoinValidator;

@Controller
@RequestMapping("/join.do")
public class JoinController {

	static Logger logger = Logger.getLogger(JoinController.class);

	private JoinService joinService;

	public void setJoinService(JoinService joinService) {
		this.joinService = joinService;
	}

	@ModelAttribute("command")
	protected Object formBackingObject() throws Exception {
		return new JoinRequest();
	}

	@RequestMapping(method = RequestMethod.GET)
	public String form() {
		logger.debug("JoinController.form()::::::GET");
		return "member/join";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String save(@ModelAttribute("command") JoinRequest jr, BindingResult result) throws Exception {
		// 1. 입력값 검증
		logger.debug("JoinController.form():::::::POST");
		new JoinValidator().validate(jr, result);
		
		if(result.hasErrors()){
			logger.debug(result.getAllErrors());
			logger.debug("result.hasErrors()실행");
			return "member/join";
		}
		logger.debug("result.hasErrors()탈출");

		//비번과 주번 암호화.
		jr.setUserPW(SecurityUtil.getCryptoMD5String(jr.getUserPW()));
		jr.setTailResident(SecurityUtil.getCryptoMD5String(jr.getTailResident()));
		
		System.out.println("encryption:"+SecurityUtil.getCryptoMD5String(jr.getUserPW()));
		System.out.println("encryption:"+SecurityUtil.getCryptoMD5String(jr.getTailResident()));
		
		joinService.join(jr);
		logger.debug("join_process로 이동");
		return "member/join_process";
	}
}
