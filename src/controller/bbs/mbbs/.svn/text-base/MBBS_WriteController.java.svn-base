package controller.bbs.mbbs;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import model.MBBS_Article;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.FileService;
import service.IdGenerationFailedException;
import service.bbs.mbbs.MBBS_WriteService;
import validator.MBBS_Validator;






@Controller
@RequestMapping("/mbbs_write.do")
public class MBBS_WriteController {
	
	static Logger logger = Logger.getLogger(MBBS_WriteController.class);
	
	private FileService fileService;
	private MBBS_WriteService mbbs_WriteService;
	
	//------------------------------------------------------------------------
	public void setMbbs_WriteService(MBBS_WriteService mbbs_WriteService) {
		this.mbbs_WriteService = mbbs_WriteService;
	}
	public void setFileService(FileService fileService) {
		this.fileService = fileService;
	}
	//------------------------------------------------------------------------
	@ModelAttribute("mbbs_Article")
	protected Object formBackingObject() throws Exception {
		return new MBBS_Article();
	}
	@RequestMapping( method =RequestMethod.GET)
	public ModelAndView  form(){
		ModelAndView mav = new ModelAndView("bbs/mbbs_write_form");
		return mav;
	}
	@RequestMapping( method = RequestMethod.POST)
	public ModelAndView write(HttpServletRequest request,@ModelAttribute MBBS_Article mbbs_Article,BindingResult errors){
		ModelAndView mav = new ModelAndView("redirect:/mbbs_list.do");
		new MBBS_Validator().validate(mbbs_Article, errors);
		if(errors.hasErrors()){
			mav.setViewName("bbs/mbbs_write_form");
			mav.addObject("mbbs_Article", mbbs_Article);
			return mav;
		}		
		int picNum = 0;
		try {
			if(mbbs_Article.getFile().isEmpty()){
				System.out.println("±è¹Î¿õ 1 file empty");
				picNum = 0;
			}else{
				System.out.println("±è¹Î¿õ 2 file  not empty");
				picNum = fileService.fileUpload(mbbs_Article.getFile(), "bbs", request.getSession().getServletContext().getRealPath("images"));
				System.out.println(picNum);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		mbbs_Article.setMbbs_picnum(Integer.toString(picNum));
		try {
				System.out.println(mbbs_Article.getMbbs_content());
			
				mbbs_WriteService.write(mbbs_Article);
				
			} catch (IdGenerationFailedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}catch (SQLException e) {
				e.printStackTrace();
		}
		
		return mav;
	}
	
	
	

}
