package controller.bbs.mbbs;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import model.MBBS_ReplyingRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import service.ArticleNotFoundException;
import service.CannotReplyArticleException;
import service.FileService;
import service.IdGenerationFailedException;
import service.LastChildAleadyExistsException;
import service.bbs.mbbs.MBBS_WriteService;


@Controller
@RequestMapping("/mbbs_reply.do")
public class MBBS_ReplyController {
	static Logger logger = Logger.getLogger(MBBS_ReplyController.class);
	private MBBS_WriteService mbbs_WriteService;
	private FileService fileService;

	
	public FileService getFileService() {
		return fileService;
	}


	public void setFileService(FileService fileService) {
		this.fileService = fileService;
	}


	public void setMbbs_WriteService(MBBS_WriteService mbbs_WriteService) {
		this.mbbs_WriteService = mbbs_WriteService;
	}
	

	@ModelAttribute("command")
	protected Object formBackingObject() throws Exception {
		return new MBBS_ReplyingRequest();
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public String form(){			
		return "bbs/mbbs_reply_form";
	}

	
	@RequestMapping(method = RequestMethod.POST)
	public String save(HttpSession session,
			@ModelAttribute("command") MBBS_ReplyingRequest rr,BindingResult result,
			@RequestParam(value="p", defaultValue="1") String page) 
			throws IdGenerationFailedException, 
			  	   ArticleNotFoundException, 
			  	   CannotReplyArticleException, 
			  	   LastChildAleadyExistsException, SQLException{
	
		int picNum = 0;
		
		System.out.println(session.getServletContext().getRealPath("images"));
		System.out.println(rr.getFile());
		System.out.println(rr.getFile().getOriginalFilename());
		try {
			if(rr.getFile().isEmpty()){
				System.out.println("±è¹Î¿õ 1 file empty");
				picNum = 0;
			}else{
				System.out.println("±è¹Î¿õ 2 file  not empty");
				picNum = fileService.fileUpload(rr.getFile(), "bbs", session.getServletContext().getRealPath("images"));
				System.out.println(picNum);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		rr.setMbbs_picnum(Integer.toString(picNum));
		//2.¼­ºñ½º °´Ã¼¿¡ ÀúÀå ¸Þ¼Òµå È£Ãâ
		
		mbbs_WriteService.writeReply(rr);
		return "redirect:/mbbs_list.do?p=" + page;
	}
}
