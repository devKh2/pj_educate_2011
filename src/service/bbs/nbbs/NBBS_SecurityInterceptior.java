package service.bbs.nbbs;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class NBBS_SecurityInterceptior extends HandlerInterceptorAdapter{
	
	public boolean preHandle (HttpServletRequest request,HttpServletResponse response,
			Object handler)throws Exception{
		if(request.getSession().getAttribute("member") != null){
			
			return true;
		}else{
			
			response.sendRedirect(request.getContextPath() +"/login_form.do");
			return false;
		}
	}
}
