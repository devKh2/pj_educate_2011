package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DesignModel;
import model.Member;
import model.MenuModel;
import model.StoreModel;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import service.FileService;
import service.MenuService;
import service.StoreService;
import validator.MasterMenuValidator;
import validator.StoreMenuValidator;

@Controller
public class BlogController {
	StoreService storeService;
	MenuService menuService;
	FileService fileService;
	
	public void setFileService(FileService fileService) {
		this.fileService = fileService;
	}
	public void setStoreService(StoreService storeService) {
		this.storeService = storeService;
		
	}
	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}
	public BlogController() {
		super();
	}
	@ModelAttribute("menuModel")
	public Object formBackingObject(){
		return new MenuModel();
	}
	
	@ModelAttribute("storeModel")
	public Object formObjectBacking(@RequestParam(value="st_num",defaultValue="false") String st_num,@RequestParam(value="stnum",defaultValue="false") String stnum) throws SQLException{
		StoreModel st=new StoreModel();
		System.out.println("stnum"+stnum);
		if(!"false".equals(stnum)){
			st=storeService.getStore(Integer.valueOf(stnum));
		}else if(!"false".equals(st_num)){
			st=storeService.getStore(Integer.valueOf(st_num));
		}else{
			st=storeService.getStore(Integer.valueOf(1));
		}
		return st;
	}
	
	
	//디자인을 가지고 있다.
	@ModelAttribute("blog_des")
	public Object formdes(@RequestParam(value="stnum",defaultValue="false") String stnum,
							@RequestParam(value="st_num",defaultValue="false") String st_num,HttpSession session) throws SQLException{
		DesignModel model= new DesignModel();
		if(!"false".equals(stnum)){
			model=storeService.getDesign(stnum);
		}else if(!"false".equals(st_num)){
			model=storeService.getDesign(st_num);
		}else{
			model=(DesignModel)session.getAttribute("blog_des");
		}
		return model;
	}
	

	
	//관리자 페이지
	@RequestMapping(value="/owner.do",method=RequestMethod.GET)
	public ModelAndView ownereMainframe(
			@RequestParam("stnum") String stnum,
			@RequestParam(value="page",defaultValue="defaultinfo.do") String page,
			HttpSession session) throws NumberFormatException, SQLException{
		ModelAndView mav=new ModelAndView("store/owner_mainframe");
		
		StoreModel st=storeService.getStore(Integer.valueOf(stnum));
		Member member=(Member)session.getAttribute("member");
		if(!st.getOwner_id().equals(member.getId())){
			mav.setViewName("redirect:/login_form.do");
			return mav;
		}
		mav.addObject("st",st);
		mav.addObject("page",page+"?stnum="+stnum);
		return mav;
	}
	
	@RequestMapping(value="/distanceCal.do",method=RequestMethod.GET)
	public ModelAndView distanceCal(@RequestParam(value="size") String size,
									HttpSession session){
		ModelAndView mav=new ModelAndView("order/distanceCal");
			Member member=(Member)session.getAttribute("member");
			String uaddr=member.getPreAddress().trim()+member.getTailAddress().trim();
			System.out.println(size);
			System.out.println(uaddr);
		mav.addObject("size", size);
		mav.addObject("uaddr",uaddr);
		return mav;
	}
	
	
	//가게의 기본정보 수정 페이지
	@RequestMapping(value="/defaultinfo.do",method=RequestMethod.GET)
	public ModelAndView owneredefaultinfo(@ModelAttribute("storeModel") StoreModel storeModel/*@RequestParam("stnum") String stnum*/) throws NumberFormatException, SQLException{
		ModelAndView mav=new ModelAndView("store/defaultinfo");
		//StoreModel st=storeService.getStore(Integer.valueOf(stnum));
		Map<String,String> select=new HashMap<String, String>();
		select.put("한식", "한식");
		select.put("중식", "중식");
		select.put("일식", "일식");
		select.put("분식", "분식");
		select.put("야식", "야식");
		mav.addObject("option",select);
		return mav;
	}
	
	//가게의 기본 정보 수정페이지 post
	@RequestMapping(value= "/modify_store.do", method = RequestMethod.POST)
	public ModelAndView owneredefaultinfo(HttpServletRequest request,@ModelAttribute("storeModel") StoreModel storeModel, BindingResult errors){
		ModelAndView mav = new ModelAndView("store/defaultinfo");
		
/*		new StoreMenuValidator().validate(storeModel, errors);
		if(errors.hasErrors()){
			mav.setViewName("store/defaultinfo");
			return mav;
		}*/
		
		int picNum = 0;
		try {
			if(storeModel.getFile().isEmpty()){
				picNum = 0;
			}else{
				picNum = fileService.fileUpload(storeModel.getFile(), "store", request.getSession().getServletContext().getRealPath("images"));
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		storeModel.setSt_picnum(Integer.toString(picNum));
		try {
			System.out.println("가게 이름:"+storeModel.getSt_num());
			storeService.insertStore(storeModel);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return mav;
	}
	
	//메뉴 추가 & 수정 페이지
	@RequestMapping(value="/menuinfo.do",method=RequestMethod.GET)
	public ModelAndView ownermenuinfo(
			@RequestParam("stnum") String stnum,
			@RequestParam(value = "pageNum", defaultValue = "1") int pageNum) throws NumberFormatException, SQLException {
		ModelAndView mav = new ModelAndView("store/menuinfo");
		StoreModel st=storeService.getStore(Integer.valueOf(stnum));
		try {
				mav.addObject("menuListModel", menuService.getMenuModelList_v(pageNum, st.getSt_name()));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		mav.addObject("st", st);
		return mav;
	}
	//메뉴 추가 & 수정 페이지
	@RequestMapping(value= "owner_add_ack.do", method = RequestMethod.POST)
	public ModelAndView add(@ModelAttribute("storeModel") StoreModel st,
			HttpServletRequest request,	@ModelAttribute("menuModel") MenuModel menuModel, BindingResult errors){
		ModelAndView mav = new ModelAndView("redirect:/menuinfo.do?stnum="+st.getSt_num());
		new MasterMenuValidator().validate(menuModel, errors);
		if(errors.hasErrors()){
			mav.setViewName("/store/owner_menu_modify");
			return mav;
		}
		int picNum = 0;
		try {
			if(menuModel.getFile().isEmpty()){
				picNum = 0;
			}else{
				picNum = fileService.fileUpload(menuModel.getFile(), "menu", request.getSession().getServletContext().getRealPath("images"));
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		menuModel.setMenu_picnum(Integer.toString(picNum));
		try {
			menuService.insertMenu(menuModel);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return mav;
	}
	@RequestMapping(value = "/menu_delete.do", method = RequestMethod.POST)
	public ModelAndView delete(@RequestParam("st_num") String st_num,
						@RequestParam("menu_name") String menu_name){
		ModelAndView mav = new ModelAndView("redirect:/menuinfo.do");
		try {
			menuService.deleteMenu(menu_name, st_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return mav;
		
	}
	
	@RequestMapping(value = "/owner_menu_ack.do", method = RequestMethod.POST)
	public ModelAndView update(@RequestParam("st_num") String st_num,
						@RequestParam(value="menu_num",required=false) String menu_num,
						@RequestParam("mode") String mode) throws NumberFormatException, SQLException{
		MenuModel menuModel = new MenuModel();
		ModelAndView mav = new ModelAndView("/store/owner_menu_opt");
		StoreModel st=storeService.getStore(Integer.valueOf(st_num));
		if("update".equals(mode)){
			try {
				menuModel = menuService.getMenuOne(menu_num, st_num);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if("add".equals(mode)){
			menuModel.setSt_num(st_num);
			menuModel.setSt_name(menu_num);
			
		}
		mav.addObject("menuModel", menuModel);
		mav.addObject("st", st);
		return mav;
	}
	
	
	//디자인 관리 페이지
	@RequestMapping(value="/designinfo.do",method=RequestMethod.GET)
	public String designModify(@ModelAttribute("blog_des") DesignModel desmodel)
	{
		return "store/designinfo";
	}
	
	@RequestMapping(value="/designinfo.do",method=RequestMethod.POST)
	public String designModify_submit(@ModelAttribute("blog_des") DesignModel desmodel,HttpServletRequest request) throws IOException, SQLException
	{
		ArrayList<MultipartFile> file =new ArrayList<MultipartFile>();
		file.add(desmodel.getFile1());
		file.add(desmodel.getFile2());
		file.add(desmodel.getFile3());
		boolean file_chk=true;
		for(MultipartFile f:file){
			if(f.getOriginalFilename().equals("")){
				file_chk=false;
			}
		}
		if(file_chk){
			fileService.fileUpload(file,"design", request.getSession().getServletContext().getRealPath("images"),desmodel);
		}
		storeService.setDesign(desmodel);
		return "store/designinfo";
	}

	
	//블로그 메인 페이지
	@RequestMapping(value="/blog.do",method=RequestMethod.GET)
	public ModelAndView mainFrame(@ModelAttribute("storeModel") StoreModel st,
									@RequestParam(value="stnum",defaultValue="3") String stnum,
									@RequestParam(value="page",defaultValue="blog2.do") String page,HttpSession session) throws SQLException{
		ModelAndView mav =new ModelAndView("store/BlogMainFrame");
		//The Display page for Iframe define.
		if(!"CartView.do".equals(page)){
			page+="?stnum="+stnum;
		}
		
		st.setGuest_cnt(String.valueOf(storeService.countGuest(stnum)));
		
		DesignModel model=storeService.getDesign(stnum);
		session.setAttribute("blog_des", model);
		mav.addObject("st",st);
		mav.addObject("stnum",stnum);
		mav.addObject("page",page);
		return mav;
	}
	
	@RequestMapping(value="info.do",method=RequestMethod.GET)
	public String form(@ModelAttribute("storeModel") StoreModel st) throws NumberFormatException, SQLException{
		return "store/storeInfo";
	}
	
	@RequestMapping(value="/favorite.do",method=RequestMethod.GET)
	public String favorite() throws NumberFormatException, SQLException{
		return "member/favorite";
	}
	
	@RequestMapping(value="mypage.do",method=RequestMethod.GET)
	public ModelAndView myPage(@RequestParam(value="page",defaultValue="memberModified.do") String page){
		ModelAndView mav=new ModelAndView("member/mypageMainFrame");
		mav.addObject("page",page);
		return mav;
	}

	@RequestMapping(value="/blog2.do",method=RequestMethod.GET)
	public ModelAndView innerMain(@RequestParam(value="stnum",defaultValue="3") String stnum) throws SQLException{
		//스토어 정보 획득
		StoreModel st=storeService.getStore(Integer.valueOf(stnum));

		//스토어 메뉴 정보 획득
		ArrayList<MenuModel> menu=storeService.getStoreMenu(Integer.valueOf(stnum));
		ModelAndView mav=new ModelAndView("store/blog_main");
		mav.addObject("st",st);
		mav.addObject("menulist",menu);
		mav.addObject("size",menu.size());
		return mav;
	}
}
