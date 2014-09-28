package controller;



import java.io.IOException;
import java.io.OutputStreamWriter;
import java.net.Socket;
import java.net.UnknownHostException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpSession;

import model.Cart;
import model.Member;
import model.MenuModel;
import model.OrderModel;
import model.SearchParam;
import model.StoreModel;

import org.apache.log4j.Logger;
import org.aspectj.org.eclipse.jdt.internal.core.util.MementoTokenizer;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import service.MenuService;
import service.OrderService;
import service.StoreService;
import validator.OrderValidator;


@Controller
public class OrderController {
	MenuService menuService;
	OrderService orderService;
	StoreService storeService;
	
	static Logger logger = Logger.getLogger(OrderController.class);
	public void setStoreService(StoreService storeService) {
		this.storeService = storeService;
	}

	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}
	
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	@ModelAttribute("order")
	public Object formObjectBacking(){
		return new OrderModel();
	}
	/*@RequestMapping(value="/orderinfo.do",method=RequestMethod.GET)
	public ModelAndView orderinfo(@RequestParam(value="mode",defaultValue="minmode") String mode,
			@RequestParam(value="orderid",defaultValue="false") String orderid,HttpSession session) throws SQLException{
		ModelAndView mav =new ModelAndView("/member/order_info");
		Member member=(Member)session.getAttribute("member");
		if(member==null){
			mav.setViewName("redirect:/login_form.do");
			return mav;
		}
		ArrayList<OrderModel> ordermodel=new ArrayList<OrderModel>();
		//minmode �ֹ���ȣ �� �ϳ���
		//nomalmode �ֹ���ȣ�� �� �ֹ�����
		//allmode ��� �ֹ� ���� ���
		if("minmode".equals(mode)){
			ordermodel=orderService.getOrderlist(member.getId(),null);
		}else if("nomalmode".equals(mode)){
			ordermodel=orderService.getOrderlist(null,orderid);
			mav.addObject("ordermodel",ordermodel);
			mav.setViewName("/member/order_detail_info");
			return mav;
		}else if("allmode".equals(mode)){
			ordermodel=orderService.getOrderlist(member.getId(),null);
		}
		
		mav.addObject("ordermodel",ordermodel);
		return mav;
	}*/
	
	@RequestMapping(value = "/orderinfo.do", method = RequestMethod.GET)
	public ModelAndView content(
			@RequestParam(value = "pageNum", defaultValue = "1") int p,
			@RequestParam(value = "state", defaultValue = "0") String state,
			HttpSession session){
		ModelAndView mav = new ModelAndView("/member/sale_list");
		SearchParam searParam = new SearchParam();
		searParam.setP(p);
		searParam.setPage_per_count(10);
		Member member= (Member)session.getAttribute("member");
		if(member==null){
			mav.setViewName("redirect:/main.do");
			return mav;
		}
		searParam.setKw(member.getId());
		searParam.setState(state);
		try {
			mav.addObject("orderList", orderService.getUserOrdersList(searParam));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mav.addObject("searchValue", member.getId());
		mav.addObject("searchKey", member.getId());
		mav.addObject("state", state);
		
		return mav;
	}
	
	//�ֹ� �޼ҵ�
	//�ֹ� ������ �Է¹޾� ȭ�鿡 ������ش�.
	@RequestMapping(value="/order.do",method=RequestMethod.GET)
	public ModelAndView order(
			@RequestParam(value="menunum",defaultValue="false") String menunum,
			@RequestParam(value="stnum",defaultValue="false") String stnum,
			@RequestParam(value="count",defaultValue="false") String count
			) throws NumberFormatException, SQLException{
		
		ModelAndView mav=new ModelAndView("/order/order");
		if("false".equals(menunum)||"false".equals(stnum)||"false".equals(count)){
			return new ModelAndView("/error/errorpage");
		}
		
		//GET ������� 1,2,3, �̷� ������ �����⶧���� ����� ���� �޼ҵ带 Tokenizer �̿��Ͽ� ��ūȭ �Ѵ�.
		ArrayList<String> countlist=Tokenizer(count);
		ArrayList<String> menunumlist=Tokenizer(menunum);
		ArrayList<String> stnumlist=Tokenizer(stnum);
		ArrayList<StoreModel> stmodel=new ArrayList<StoreModel>();
		for(String str:stnumlist){
			stmodel.add(storeService.getStore(Integer.valueOf(str)));
		}
		ArrayList<MenuModel> menulist=new ArrayList<MenuModel>();

		//�޴��� ���� ������ �Է¹޴´�. 
		for(int i=0;i<menunumlist.size();i++){
			menulist.add(menuService.getMenuOne(menunumlist.get(i),stnumlist.get(i)));	
		}
		mav.addObject("menulist",menulist);
		mav.addObject("size",menulist.size());
		mav.addObject("countlist",countlist);
		mav.addObject("st",stmodel);
		return mav;
	}
	
	
	public List<String> setDistanceNumber(List<String> dis){
		List<String> temp1=new ArrayList<String>();
		for(String temp:dis){
			temp1.add(temp.replace("km",""));
		}
		return temp1;
	}
	
	
	//���� �ֹ� �޼ҵ�
	//�ֹ� ���������� ��û�� ���� �ֹ��� DB�� ����ϰ� ��� �������� ��� �����ش�.
	@RequestMapping(value="/r_order.do",method=RequestMethod.POST)
	public ModelAndView r_order(
			@ModelAttribute("order") OrderModel ordermodel,
			BindingResult error
			,HttpSession session) throws NumberFormatException, SQLException{
		ordermodel.setStdistance(setDistanceNumber(ordermodel.getStdistance()));
		ordermodel.setUsrdistance(setDistanceNumber(ordermodel.getUsrdistance()));
		ModelAndView mav=new ModelAndView("/order/ordercomplet");
		new OrderValidator().validate(ordermodel, error);
		ArrayList<String> countlist=Tokenizer(ordermodel.getQuantity());
		ArrayList<String> menunumlist=Tokenizer(ordermodel.getMenu_num());
		ArrayList<String> stnumlist=Tokenizer(ordermodel.getSt_num());
		ArrayList<MenuModel> menulist=new ArrayList<MenuModel>();
		
		
		for(int i=0;i<menunumlist.size();i++){
			menulist.add(menuService.getMenuOne(menunumlist.get(i),stnumlist.get(i)));	
		}
		
		if(error.hasErrors()){
			ArrayList<StoreModel> stmodel=new ArrayList<StoreModel>();
			for(String str:stnumlist){
				stmodel.add(storeService.getStore(Integer.valueOf(str)));
		}
			
			//�޴��� ���� ������ �Է¹޴´�. 
			mav.addObject("menulist",menulist);
			mav.addObject("size",menulist.size());
			mav.addObject("countlist",countlist);
			mav.addObject("st",stmodel);
			mav.setViewName("/order/order");

			return mav;
		}
		
		System.out.println("list chkeck:"+ordermodel.getStdistance());
		System.out.println("list chkeck:"+ordermodel.getUsrdistance());
		
	
		ArrayList<OrderModel> orderlist=new ArrayList<OrderModel>();
		//�ֹ� ���� ����Ʈ�� OrderModel ����Ʈ�� �Ҵ��ϴ� ����� ���� setOrderlist �޼ҵ� 
		orderlist=setOrderlist(stnumlist,orderlist,menulist,countlist,ordermodel);
		//ȸ������
		Member member=(Member)session.getAttribute("member");
		if(member==null){
			return new ModelAndView("redirect:/login_form.do");
		}
		
		//�ֹ� �μ�Ʈ ����
		if(orderService.insertOrder(/*ȸ��ID_num*/member.getId(),orderlist) == 1){
			mav.addObject("flag", "flag");
			mav.setViewName("/order/orderFail");
		}
		mav.addObject("menulist",menulist);
		mav.addObject("orderlist",orderlist);
		mav.addObject("countlist",countlist);
		return mav;
	}
	

	
	
	
	
	
	//��ٱ��� View �޼ҵ�
	//���ǿ��� ȸ�������� �о�鿩�� �ش��ϴ� ��ٱ��� ����Ʈ�� �޾ƿ´�.
	@RequestMapping(value="/CartView.do")
	public ModelAndView CartView(HttpSession session) throws SQLException{
		//���ǿ��� ���� id ������ �����´�.
		//������ �α���������
		//1.��ٱ��� ����Ʈ�� �ҷ��´�.
		Member member=(Member)session.getAttribute("member");
		if(member==null){
			return new ModelAndView("redirect:/login_form.do");
		}
		ArrayList<Cart> cartList=orderService.getCartList(member.getId());
		ModelAndView mav=new ModelAndView("/member/shoppingCart");
		mav.addObject("cartlist",cartList);
		mav.addObject("listSize",cartList.size());
		return mav;
	}
	
	//��ٱ��� �߰� �޼ҵ�
	//
	@RequestMapping(value="/addCart.do")
	public String addCart(
			@RequestParam(value="menunum",defaultValue="false") String menunum,
			@RequestParam(value="stnum",defaultValue="false") String stnum,
			@RequestParam(value="count",defaultValue="false") String count,HttpSession session) throws SQLException{
		if("false".equals(menunum)||"false".equals(stnum)||"false".equals(count)){
			return "/error/errorpage";
		}
		Member member=(Member)session.getAttribute("member");
		if(member==null){
			return "redirect:/login_form.do";
		}
		ArrayList<OrderModel> orderlist=generateOrerlist(count, menunum, stnum);
		orderService.insertCart(/*�������̵�member.getId()*/member.getId(), orderlist);
		return "redirect:/CartView.do";
	}

	@RequestMapping(value="/deleteCart.do",method=RequestMethod.GET)
	public ModelAndView deleteCart(@RequestParam(value="menunum",defaultValue="false") String menunum,
			@RequestParam(value="stnum",defaultValue="false") String stnum,HttpSession session) throws SQLException{
		ModelAndView mav=new ModelAndView("/member/shoppingCart");
		
		ArrayList<String> menunumlist=Tokenizer(menunum);
		ArrayList<String> stnumlist=Tokenizer(stnum);
		ArrayList<OrderModel> orderlist=new ArrayList<OrderModel>();
		int cnt=0;
		for(int i=0;i<stnumlist.size();i++){
			OrderModel model=new OrderModel();
			model.setMenu_num(menunumlist.get(cnt));
			model.setSt_num(stnumlist.get(cnt++));
			orderlist.add(model);
		}
		Member member=(Member)session.getAttribute("member");
		if(member==null){
			return new ModelAndView("redirect:/login_form.do");
		}
		orderService.deleteCart(member.getId(), orderlist);
		ArrayList<Cart> cartList=orderService.getCartList(member.getId());
		mav.addObject("cartlist", cartList);
		return mav;
	}
	
	public ArrayList<OrderModel> setOrderlist(ArrayList<String> stnumlist,ArrayList<OrderModel> orderlist,ArrayList<MenuModel> menulist,ArrayList<String> countlist,OrderModel orderModel){
		int cnt=0;
		for(MenuModel menu:menulist){
			OrderModel model=new OrderModel();
			model.setSt_num(stnumlist.get(cnt));
			model.setMenu_num(menu.getMenu_num());
			model.setQuantity(countlist.get(cnt));
			model.setMenu_name(menu.getMenu_name());
			model.setMenu_price(menu.getMenu_price());
			model.setSt_name(menu.getSt_name());
			if(orderModel!=null){
			model.setOrder_comments(orderModel.getOrder_comments());
				model.setPreAddress(orderModel.getPreAddress());
				model.setTailAddress(orderModel.getTailAddress());
			}
			orderlist.add(model);
			cnt++;
		}
		return orderlist;
	}
	
	public ArrayList<String> Tokenizer(String str){
		StringTokenizer stk=new StringTokenizer(str,",");
		ArrayList<String> list=new ArrayList<String>();
		while(stk.hasMoreElements()){
			list.add(stk.nextToken());
		}
		return list;
	}
	
	public ArrayList<OrderModel> generateOrerlist(String count,String menunum,String stnum) throws SQLException{
		ArrayList<String> countlist=Tokenizer(count);
		ArrayList<String> menunumlist=Tokenizer(menunum);
		ArrayList<String> stnumlist=Tokenizer(stnum);
		
		ArrayList<MenuModel> menulist=new ArrayList<MenuModel>();
		System.out.println("���׷���Ʈ �ƴ�����Ʈ ����"+menunumlist.size());	
		for(int i=0;i<menunumlist.size();i++){
			menulist.add(menuService.getMenuOne(menunumlist.get(i),stnumlist.get(i)));	
		}
		ArrayList<OrderModel> orderlist=new ArrayList<OrderModel>();
		System.out.println("���׷���Ʈ �ƴ�����Ʈ ����");	
		orderlist=setOrderlist(stnumlist,orderlist,menulist,countlist,null);
		return orderlist;
	}
	
	

}
