package controller;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import encryption.SecurityUtil;

import model.Member;
import service.JoinService;

//로그인 이벤트 발생하는 컨트롤러

@Controller
public class LoginController {
	private JoinService joinService;

	static Logger logger = Logger.getLogger(LoginController.class);
	public void setJoinService(JoinService joinService) {
		this.joinService = joinService;
	}
	
	@RequestMapping("/main_login_form.do")
	public String mainform() {
		return "main/mainLoginForm";
	}

	@RequestMapping("/login_form.do")
	public String form() {
		return "member/login";
	}
	
	@RequestMapping("/login_from_result.do")
	public ModelAndView login_from_result(HttpSession session, 	@RequestParam("id") String id,
										@RequestParam("pw") String pw, 
										@RequestParam(value = "member_type") String member_type) throws Exception{
		
		
		pw=SecurityUtil.getCryptoMD5String(pw);
		
		System.out.println("암호화:"+pw);
		logger.debug("LoginController.login():::::::::::실행");
		logger.debug("!!!!!!!!!!!!!!!!!!!member_type:  " + member_type);
		ModelAndView mav = new ModelAndView();
		System.out.println("로그인 방식 = >" + member_type);
		//로그인 멤버가 '가게주인'이면
		if("storeMember".equals(member_type) ){
			Member store_member = joinService.storeMember_login(id, pw);
			logger.debug(id +":"+ pw);
			mav.setViewName("member/login");	
			if(store_member != null){
				store_member.setMember_type("storeMember");
				
				session.setAttribute("member", store_member);
				mav.addObject("success", "success");
			} else{
				mav.addObject("loginFail", "fail");
			}
			return mav;
		}
		//로그인 멤버가 '관리자'이면
		else if("administrator".equals(member_type)){
			Member admin_member = joinService.adminMember_login(id, pw);
			logger.debug(id + ":" +pw);
			mav.setViewName("member/login");
			if(admin_member != null){
				admin_member.setMember_type("administrator");
				session.setAttribute("member", admin_member);
				mav.addObject("success", "success");
			} else{
				mav.addObject("loginFail", "fail");
			}
			return mav;
		}
		
		
		//로그인 멤버가 '일반회원'이면
		else {
			Member member = joinService.login(id, pw);
			logger.debug(id +":"+ pw);
			mav.setViewName("member/login");
			if(member != null){
				member.setMember_type("customer");
				session.setAttribute("member", member);
				mav.addObject("success", "success");
			} else{
				mav.addObject("loginFail", "fail");
			}
			return mav;
		}
	}

		
	
	//즐찾 추가
	@RequestMapping(value="favoriteAdd.do",method=RequestMethod.GET)
	public String login(@RequestParam("stnum") String st_num,HttpSession session) throws SQLException{
		Member member=(Member)session.getAttribute("member");
		String type=member.getMember_type();
		joinService.insertFavoriteSite(st_num, member.getId());
		if(type.equals("storeMember")){
			member = joinService.storeMember_login(member.getId(), member.getPw());
		}else if(type.equals("customer")){
			member=joinService.login(member.getId(),member.getPw());
		}else if(type.equals("administrator")){
			member = joinService.adminMember_login(member.getId(),member.getPw());
		}
		member.setMember_type(type);
		session.setAttribute("member", member);
		return "redirect:/blog.do?stnum="+st_num;
	}
	

	@RequestMapping("/login.do")
	public ModelAndView login(HttpSession session, 	@RequestParam("id") String id, 
													@RequestParam("pw") String pw, 
													@RequestParam(value = "member_type") String member_type) throws Exception{
		
		
		pw=SecurityUtil.getCryptoMD5String(pw);
		
		System.out.println("암호화:"+pw);
		logger.debug("LoginController.login():::::::::::실행");
		logger.debug("!!!!!!!!!!!!!!!!!!!member_type:  " + member_type);
		ModelAndView mav = new ModelAndView();
		System.out.println("로그인 방식 = >" + member_type);
		//로그인 멤버가 '가게주인'이면
		if("storeMember".equals(member_type) ){
			Member store_member = joinService.storeMember_login(id, pw);
			logger.debug(id +":"+ pw);
			mav.setViewName("main/mainLoginForm");	
			if(store_member != null){
				store_member.setMember_type("storeMember");
				session.setAttribute("member", store_member);
			} else{
				mav.addObject("loginFail", "fail");
			}
			return mav;
		}
		
		
		//로그인 멤버가 '관리자'이면
		else if("administrator".equals(member_type)){
			Member admin_member = joinService.adminMember_login(id, pw);
			logger.debug(id + ":" +pw);
			mav.setViewName("main/mainLoginForm");
			if(admin_member != null){
				admin_member.setMember_type("administrator");
				session.setAttribute("member", admin_member);
			} else{
				mav.addObject("loginFail", "fail");
			}
			return mav;
		}
		//로그인 멤버가 '일반회원'이면
		else {
			Member member = joinService.login(id, pw);
			logger.debug(id +":"+ pw);
			mav.setViewName("main/mainLoginForm");
			if(member != null){
				member.setMember_type("customer");
				session.setAttribute("member", member);
			} else{
				mav.addObject("loginFail", "fail");
			}
			return mav;
		}
	}

	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpSession session) {
		logger.debug("LoginController.logout():::::::::::실행");
		ModelAndView mav = new ModelAndView();
		
		session.invalidate();
		mav.setViewName("main/mainLoginForm");
		return mav;
	}

}