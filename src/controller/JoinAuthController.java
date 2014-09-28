package controller;


import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mail.MailTransfer;
import model.AuthNumModel;
import service.IdGenerationFailedException;
import service.JoinAuthService;

@Controller
@RequestMapping("/authentication.do")
public class JoinAuthController {

	static Logger logger = Logger.getLogger(JoinAuthController.class);

	private JoinAuthService joinAuthService;
	
	public void setJoinAuthService(JoinAuthService joinAuthService) {
		this.joinAuthService = joinAuthService;
	}

	@RequestMapping(method = RequestMethod.GET)
	public String form() {
		logger.debug("JoinAuthController.form()::::::GET");
		return "member/authentication";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView sendEmail(	@RequestParam(value = "email") String email, 
									@RequestParam(value = "checkNum", required = false) String checkNum) 
									throws IdGenerationFailedException {
	
		logger.debug("JoinAuthController.sendEmail():::::::POST");
		
		AuthNumModel authNumModel = new AuthNumModel();
		String from = "peach@goochim.com";
		String to = email;
		logger.debug("!!!!!!!!!!!!checkNum:  " + checkNum);
		if(checkNum == ""){  // 인증번호 받기위한 로직  (인증번호받기 버튼 이벤트 발생시 실행)
			
			String authNum = String.valueOf(getRandNum());  //난수 생성
			authNumModel = new AuthNumModel();
			authNumModel.setAuthNumber(authNum);
			authNumModel.setEmail(to);
			
			logger.debug("받는 사람의 이메일 주소는: " + to);
			
			if(joinAuthService.isEmailExist(to)){
				logger.debug("joinAuthService.isEmailExist(to)의 결과값:  " + to + "존재함");
				int res = joinAuthService.emailDelete(to);
				logger.debug("이메일 " + res + "개 를 삭제했습니다");
			}
			else{
				logger.debug("joinAuthService.isEmailExist(to)의 결과값:  " + joinAuthService.isEmailExist(to) + "   존재하지 않음");
			}
			joinAuthService.joinAuth(authNumModel); // db에 이멜주소와 난수값 저장
			logger.debug("DB에 저장되었다!!!!! "+ authNum + ":::" + to);
			
			MailTransfer mailTransfer = new MailTransfer(from, to, authNum);
			mailTransfer.mailSend();  // 메일 전송
			
			logger.debug("메일 전송 완료");
			
			ModelAndView mav = new ModelAndView("member/authentication");
			mav.addObject("authNumModel", authNumModel);
		//	return "authentication";
			return mav;
		}
		else{
			authNumModel.setAuthNumber(checkNum);
			authNumModel.setEmail(to);
			logger.debug("인증번호 확인할 거임:  입력한 인증번호는: " + checkNum);
			
			String res = null;
			boolean rtn = joinAuthService.isExist(authNumModel);
			if(rtn == true){
				res = "success";
			}else if (rtn == false){
				res = "fail";
			}else
				res = "default";
			
			logger.debug("rtn:   " + rtn);
			logger.debug("인증확인:   " + rtn);
			authNumModel.setResult(res);
			
			ModelAndView mav = new ModelAndView("member/authentication");
			mav.addObject("authNumModel", authNumModel);
			
			//return "authentication";
			return mav;
		}	
	}
	
	//난수 생성
	public int getRandNum(){
		int authNumber = (int)(Math.random()*10000);
		logger.debug("난수는:  " + authNumber);
		return authNumber;
	}
}
