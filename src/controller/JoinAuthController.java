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
		if(checkNum == ""){  // ������ȣ �ޱ����� ����  (������ȣ�ޱ� ��ư �̺�Ʈ �߻��� ����)
			
			String authNum = String.valueOf(getRandNum());  //���� ����
			authNumModel = new AuthNumModel();
			authNumModel.setAuthNumber(authNum);
			authNumModel.setEmail(to);
			
			logger.debug("�޴� ����� �̸��� �ּҴ�: " + to);
			
			if(joinAuthService.isEmailExist(to)){
				logger.debug("joinAuthService.isEmailExist(to)�� �����:  " + to + "������");
				int res = joinAuthService.emailDelete(to);
				logger.debug("�̸��� " + res + "�� �� �����߽��ϴ�");
			}
			else{
				logger.debug("joinAuthService.isEmailExist(to)�� �����:  " + joinAuthService.isEmailExist(to) + "   �������� ����");
			}
			joinAuthService.joinAuth(authNumModel); // db�� �̸��ּҿ� ������ ����
			logger.debug("DB�� ����Ǿ���!!!!! "+ authNum + ":::" + to);
			
			MailTransfer mailTransfer = new MailTransfer(from, to, authNum);
			mailTransfer.mailSend();  // ���� ����
			
			logger.debug("���� ���� �Ϸ�");
			
			ModelAndView mav = new ModelAndView("member/authentication");
			mav.addObject("authNumModel", authNumModel);
		//	return "authentication";
			return mav;
		}
		else{
			authNumModel.setAuthNumber(checkNum);
			authNumModel.setEmail(to);
			logger.debug("������ȣ Ȯ���� ����:  �Է��� ������ȣ��: " + checkNum);
			
			String res = null;
			boolean rtn = joinAuthService.isExist(authNumModel);
			if(rtn == true){
				res = "success";
			}else if (rtn == false){
				res = "fail";
			}else
				res = "default";
			
			logger.debug("rtn:   " + rtn);
			logger.debug("����Ȯ��:   " + rtn);
			authNumModel.setResult(res);
			
			ModelAndView mav = new ModelAndView("member/authentication");
			mav.addObject("authNumModel", authNumModel);
			
			//return "authentication";
			return mav;
		}	
	}
	
	//���� ����
	public int getRandNum(){
		int authNumber = (int)(Math.random()*10000);
		logger.debug("������:  " + authNumber);
		return authNumber;
	}
}
