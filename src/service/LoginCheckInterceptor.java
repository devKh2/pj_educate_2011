package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class LoginCheckInterceptor extends HandlerInterceptorAdapter {

	@SuppressWarnings("null")
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		String articleId = request.getParameter("articleId");
		request.setAttribute("articleId", articleId);
		System.out.println(articleId);

		if (request.getSession().getAttribute("member") != null) {
			
			System.out.println("/read.do?articleId="+articleId);
			
			//response.sendRedirect(request.getContextPath() + "/read.do?articleId="+articleId);
			return true;
		}else{
			System.out.println("/login_form.do");
			response.sendRedirect(request.getContextPath() + "/login_form.do");
			return false;
		}
	}
}
