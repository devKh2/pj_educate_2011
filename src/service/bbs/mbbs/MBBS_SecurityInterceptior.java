package service.bbs.mbbs;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MBBS_SecurityInterceptior extends HandlerInterceptorAdapter{
	
	public boolean preHandle (HttpServletRequest request,HttpServletResponse response,
			Object handler)throws Exception{
		
		//session 에 있는 member 정보를 읽어들여 login 이 되어있는지 판단하는 문장 입니다.
		//login 이 되어 있으면 통과 아니면 login 창으로 redirect 시킵니다.
		
		if(request.getSession().getAttribute("member") != null){
			return true;
		}else{
			
			response.sendRedirect(request.getContextPath() +"/login_form.do");
			return false;
		}
	}
}
