package controller;

import model.PostListModel;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import service.PostService;


@Controller
public class PostController {
	static Logger logger = Logger.getLogger(PostController.class);
	private PostService postService;
	
	public void setPostService(PostService postService) {
		this.postService = postService;
	}
	
	@RequestMapping(value = "master/post.do", method = RequestMethod.GET)
	public String masterform() {
		logger.debug("JoinController.form()::::::GET");
		return "/master/post";
	}

	@RequestMapping(value = "master/post.do", method = RequestMethod.POST)
	public ModelAndView masterlist(@RequestParam(value = "searchDong") String searchDong){
		logger.debug("PostController의 ModelAndView의 list메서드 실행");
		ModelAndView mav = new ModelAndView("/master/post");
		PostListModel listModel  = postService.getPostList(searchDong);
		mav.addObject("listModel", listModel);
		return mav;	// post.jsp로 
	}
	
	@RequestMapping(value = "member/post.do", method = RequestMethod.GET)
	public String memberform() {
		logger.debug("JoinController.form()::::::GET");
		return "/member/post";
	}

	@RequestMapping(value = "member/post.do", method = RequestMethod.POST)
	public ModelAndView memberlist(@RequestParam(value = "searchDong") String searchDong){
		logger.debug("PostController의 ModelAndView의 list메서드 실행");
		ModelAndView mav = new ModelAndView("/member/post");
		PostListModel listModel  = postService.getPostList(searchDong);
		mav.addObject("listModel", listModel);
		return mav;	// post.jsp로 
	}
	
	@RequestMapping(value = "order/post.do", method = RequestMethod.GET)
	public String orderform() {
		logger.debug("JoinController.form()::::::GET");
		return "/order/post";
	}

	@RequestMapping(value = "order/post.do", method = RequestMethod.POST)
	public ModelAndView orderlist(@RequestParam(value = "searchDong") String searchDong){
		logger.debug("PostController의 ModelAndView의 list메서드 실행");
		ModelAndView mav = new ModelAndView("/order/post");
		PostListModel listModel  = postService.getPostList(searchDong);
		mav.addObject("listModel", listModel);
		return mav;	// post.jsp로 
	}
}
