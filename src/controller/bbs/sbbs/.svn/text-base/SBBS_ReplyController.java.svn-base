package controller.bbs.sbbs;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;


import model.Member;
import model.SBBS_ReplyingRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import service.ArticleNotFoundException;
import service.CannotReplyArticleException;
import service.IdGenerationFailedException;
import service.LastChildAleadyExistsException;
import service.bbs.sbbs.SBBS_WriteService;



@Controller
@RequestMapping("/sbbs_reply.do")
public class SBBS_ReplyController {
	static Logger logger = Logger.getLogger(SBBS_ReplyController.class);
	private SBBS_WriteService sbbs_WriteService;	

	
	public void setSbbs_WriteService(SBBS_WriteService sbbs_WriteService) {
		this.sbbs_WriteService = sbbs_WriteService;
	}
	

	@ModelAttribute("command")
	protected Object formBackingObject() throws Exception {
		return new SBBS_ReplyingRequest();
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public String form(){			
		return "bbs/sbbs_reply_form";
	}

	
	@RequestMapping(method = RequestMethod.POST)
	public String save(HttpSession session,
			@ModelAttribute("command") SBBS_ReplyingRequest rr,BindingResult result,
			@RequestParam(value="p", defaultValue="1") String page,
			@RequestParam(value="stnum") int stnum) 
			throws IdGenerationFailedException, 
			  	   ArticleNotFoundException, 
			  	   CannotReplyArticleException, 
			  	   LastChildAleadyExistsException, SQLException{
	
		//2.서비스 객체에 저장 메소드 호출
		Member member = (Member)session.getAttribute("member");
		System.out.println(stnum + "stnum 입니다.");
		rr.setCu_id(member.getId());
		rr.setSt_num(stnum);
		
		System.out.println(rr.getSt_num() + "rr.getSt_num()");
		sbbs_WriteService.writeReply(rr);
		return "redirect:/sbbs_list.do?p=" + page+"&stnum="+stnum;
	}
}
