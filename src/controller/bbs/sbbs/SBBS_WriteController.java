package controller.bbs.sbbs;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.Member;
import model.SBBS_Article;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import service.FileService;
import service.IdGenerationFailedException;
import service.bbs.sbbs.SBBS_WriteService;
import validator.SBBS_Validator;

@Controller
@RequestMapping("/sbbs_write.do")
public class SBBS_WriteController {
	
	static Logger logger = Logger.getLogger(SBBS_WriteController.class);
	
	private FileService fileService;
	private SBBS_WriteService sbbs_WriteService;
	
	//------------------------------------------------------------------------
	public void setSbbs_WriteService(SBBS_WriteService sbbs_WriteService) {
		this.sbbs_WriteService = sbbs_WriteService;
	}
	public void setFileService(FileService fileService) {
		this.fileService = fileService;
	}
	//------------------------------------------------------------------------
	@ModelAttribute("sbbs_Article")
	protected Object formBackingObject( HttpSession session
			,@RequestParam(value="stnum",defaultValue="false") int stnum) throws Exception {
		Member member =(Member)session.getAttribute("member");
		String memberId = null;
		if(member.getId()!=null){
			memberId = member.getId();
		}
		SBBS_Article sbbs_Article = new SBBS_Article();
		System.out.println(stnum);
		System.out.println(memberId);
		sbbs_Article.setSt_num(stnum);
		sbbs_Article.setCu_id(memberId);
		return sbbs_Article;
	}
	@RequestMapping( method =RequestMethod.GET)
	public ModelAndView  form(){
		System.out.println("SBBS_WriteController À¸·Î µé¾î¿È ");
		ModelAndView mav = new ModelAndView("bbs/sbbs_write_form");
		return mav;
	}
	@RequestMapping( method = RequestMethod.POST)
	public ModelAndView write(HttpSession session,
							HttpServletRequest request,
							@ModelAttribute SBBS_Article sbbs_Article,
							BindingResult errors,
							@RequestParam(value="stnum",defaultValue="false") int stnum){
		ModelAndView mav = new ModelAndView("redirect:/sbbs_list.do");
		mav.addObject("stnum",stnum);
		new SBBS_Validator().validate(sbbs_Article, errors);
		if(errors.hasErrors()){
			mav.setViewName("bbs/sbbs_write_form");
			mav.addObject("sbbs_Article", sbbs_Article);
			return mav;
		}
		
		Member member =(Member)session.getAttribute("member");
		String memberId = null;
		if(member.getId()!=null){
			memberId = member.getId();
		}
		System.out.println(stnum);
		System.out.println(memberId);
		sbbs_Article.setSt_num(stnum);
		sbbs_Article.setCu_id(memberId);
		
		int picNum = 0;
		try {
			if(sbbs_Article.getFile().isEmpty()){
				System.out.println("±è¹Î¿õ 1 file empty");
				picNum = 0;
			}else{
				System.out.println("±è¹Î¿õ 2 file  not empty");
				picNum = fileService.fileUpload(sbbs_Article.getFile(), "bbs", request.getSession().getServletContext().getRealPath("images"));
				System.out.println(picNum);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		sbbs_Article.setSbbs_picnum(Integer.toString(picNum));
		try {
				System.out.println(sbbs_Article.getCu_id() + "1234");
				System.out.println(sbbs_Article.getSt_num() + "1234");
				sbbs_WriteService.write(sbbs_Article);
				
			} catch (IdGenerationFailedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}catch (SQLException e) {
				e.printStackTrace();
		}
		
		return mav;
	}
	
	
	

}
