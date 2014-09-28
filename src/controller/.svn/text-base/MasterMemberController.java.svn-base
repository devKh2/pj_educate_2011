package controller;

import java.sql.SQLException;

import model.SearchParam;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import service.MemberService;

@Controller
public class MasterMemberController {

	private MemberService memberService;
	
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}


	@RequestMapping(value = "master/member.do", method = RequestMethod.GET)
	public ModelAndView content(
			@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
			@RequestParam(value = "searchValue", required = false) String searchValue,
			@RequestParam(value = "searchKey", required = false) String searchKey){
		ModelAndView mav = new ModelAndView("/master/member_list");
		SearchParam param = new SearchParam();
		param.setKw(searchValue);
		param.setP(pageNum);
		
		try {
			mav.addObject("memberList", memberService.getMemberList(param));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mav.addObject("searchValue", searchValue);
		return mav;
	}
	
	@RequestMapping(value = "master/delete_member.do", method = RequestMethod.POST)
	public ModelAndView delete(@RequestParam("id") String id){
		ModelAndView mav = new ModelAndView("redirect:/master/member.do");
		try {
			memberService.deleteMember(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return mav;
		
	}
}
