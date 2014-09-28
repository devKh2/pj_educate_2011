package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import model.OrderListRequest;
import model.SaleDaySearch;
import model.SearchParam;
import model.StatsListModel;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import service.OrderService;
import service.StatsService;

@Controller
public class MasterSaleController {

	static Logger logger = Logger.getLogger(MasterSaleController.class);
	
	private StatsService statsService;
	
	public void setStatsService(StatsService statsService) {
		this.statsService = statsService;
	}
	
	OrderService orderService;
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	
	@ModelAttribute
	public Object formBackingObject(){
		return new SearchParam();
	}
	
	@RequestMapping(value = "master/sale_list.do", method = RequestMethod.GET)
	public ModelAndView content(@ModelAttribute SearchParam params,
			@RequestParam(value = "pageNum", defaultValue = "1") int p,
			@RequestParam(value = "searchKey", required = false) String searchKey,
			@RequestParam(value = "state", defaultValue = "0") String state,
			@RequestParam(value = "searchValue", required = false) String searchValue){
		ModelAndView mav = new ModelAndView("/master/sale_list");
		SearchParam searParam = new SearchParam();
		searParam.setKw(searchValue);
		searParam.setP(p);
		searParam.setPage_per_count(10);
		searParam.setSc(searchKey);
		searParam.setState(state);
		try {
			OrderListRequest list = orderService.getOrdersList(searParam);
			mav.addObject("orderList", list);
			mav.addObject("listSize", list.getOrderList().size());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mav.addObject("searchKey", searchKey);
		mav.addObject("state", state);
		return mav;
	}
	

	@RequestMapping(value = "master/sale.do", method = RequestMethod.GET)
	public String form(@RequestParam(value = "content", defaultValue = "list") String contentName){		// 검색어 가게이름
		String path = "/master/";
		if(contentName.equals("sale_status_day")){
			path += "sale_status_day_default";
		}
		else if(contentName.equals("sale_status_month")){
			path += "sale_status_day_detail";
		}
		else {
			path += "sale_list"; 
		}
		return path;
	}
	
	@RequestMapping(value ="master/sale_status_day_default.do", method = RequestMethod.GET)
	public ModelAndView form(	@RequestParam(value = "status_year", defaultValue = "11") String year,
								@RequestParam(value = "status_month", defaultValue ="02" ) String month,
								@RequestParam(value = "status_day", defaultValue = "01") String day,
								@RequestParam(value = "st_name", required = false) String st_name){
		
		ModelAndView mav = new ModelAndView("/master/sale_status_day_default");

		
		 //오늘 날짜 입력
		
		Calendar cal = Calendar.getInstance();
		year = String.valueOf(cal.get(Calendar.YEAR));
		month = String.valueOf(cal.get(Calendar.MONTH) + 1);
		if(Integer.parseInt(month) <10){
			month = "0" + month;
		}
		day = String.valueOf(cal.get(Calendar.DAY_OF_MONTH));
		if(Integer.parseInt(day) <10){
			day = "0" + day;
		}
		
		
		SaleDaySearch saleDaySearch = new SaleDaySearch();
		
		String date = year + "/" + month + "/" + day ;
		//String date = "11/02/1";
		saleDaySearch.setDate(date);
		
		StatsListModel listModel  = statsService.getList(saleDaySearch);
		
		String viewDate = year + "년 " + month + "월 " + day + "일 ";
		
		listModel.setDate(date);
		listModel.setViewDate(viewDate);
		mav.addObject("listModel", listModel);
	
		return mav;
	}
		
	
	@RequestMapping(value = "master/sale_status_day_default.do", method = RequestMethod.POST)
	public ModelAndView storelist(	@RequestParam(value = "status_year", defaultValue = "11") String year,
			@RequestParam(value = "status_month", defaultValue = "2") String month,
			@RequestParam(value = "status_day", defaultValue = "1") String day,
			@RequestParam(value = "status_st_name", required = false) String st_name,
			@RequestParam(value = "array", required = false) String array){
		
		ModelAndView mav = new ModelAndView("/master/sale_status_day_default");
		
		SaleDaySearch saleDaySearch = new SaleDaySearch();
		
		String date = year + "/" + month + "/" + day ;
		
		saleDaySearch.setDate(date);
		
		//가게이름이 있을때 
		if(st_name != null){
			saleDaySearch.setSt_name(st_name);
		}
		
		StatsListModel listModel  = statsService.getList(saleDaySearch);
		
		String viewDate = year + "년 " + month + "월 " + day + "일 ";
		listModel.setDate(date);
		listModel.setViewDate(viewDate);
		
		mav.addObject("listModel", listModel);
		return mav;
	}
	
	@RequestMapping(value = "master/sale_status_day_detail.do", method = RequestMethod.GET)
	public ModelAndView form1(	@RequestParam(value = "status_date") String date,
								@RequestParam(value = "status_st_num") int st_num,
								@RequestParam(value = "status_totalProfit") int totalProfit,
								@RequestParam(value = "status_st_name") String st_name){

		ModelAndView mav = new ModelAndView("/master/sale_status_day_detail");
		SaleDaySearch saleDaySearch = new SaleDaySearch();		
		
		saleDaySearch.setDate(date);
		saleDaySearch.setSt_num(st_num);
		
		
		StatsListModel listModel  = statsService.geteachStoreList(saleDaySearch);
		//2011년2월1일 : viewDate필드를 만들기 위한 로직
		String viewDate = viewDateMk(date);
		
		listModel.setDate(date);
		listModel.setViewDate(viewDate);
		listModel.setTotalProfit(totalProfit);
		listModel.setSt_name(st_name);
		mav.addObject("listModel", listModel);
		return mav;
	}
	
	@RequestMapping(value = "master/sale_status_day_detail.do", method = RequestMethod.POST)
	public ModelAndView storelist1(	@RequestParam(value = "status_year") String year,
									@RequestParam(value = "status_month") String month,
									@RequestParam(value = "status_day") String day,
									@RequestParam(value = "status_st_num") int st_num,
									@RequestParam(value = "status_st_name") String st_name){


		ModelAndView mav = new ModelAndView("/master/sale_status_day_detail");
		SaleDaySearch saleDaySearch = new SaleDaySearch();		
		
		String date = year + "/" + month + "/" + day ;
		String viewDate = year + "년 " + month + "월 " + day + "일 ";
		
		saleDaySearch.setDate(date);
		
		//DayOfStats_Total dayOfStats_Total = new DayOfStats_Total();
		saleDaySearch.setSt_num(st_num);
		
		StatsListModel listModel  = statsService.geteachStoreList(saleDaySearch);
		
		date = saleDaySearch.getDate();
		
		listModel.setDate(date);
		listModel.setDate(viewDate);
		mav.addObject("listModel", listModel);
		return mav;
	}
	
	@RequestMapping(value = "master/sale_status_month_default.do", method = RequestMethod.GET)
	public ModelAndView get_Month_defaultForm(	@RequestParam(value = "status_year", required = false) String year,
										@RequestParam(value = "st_name", required = false) String st_name){
		
		ModelAndView mav = new ModelAndView("/master/sale_status_month_default");
		
		// year값이 없으면  this year를 셋팅
		if(year == null){
			Calendar cal = Calendar.getInstance();
			year = String.valueOf(cal.get(Calendar.YEAR));
			year = year.substring(2);
		}
		
		// year 자릿수가 4자리이면 2자리로 짤르기 위한 if문
		if(year.length() == 4){
			year = year.substring(2);
		}
		
		SaleDaySearch saleYearSearch = new SaleDaySearch();
		
		saleYearSearch.setDate(year);
		
		StatsListModel listModel = statsService.getYearList(saleYearSearch);
		
		String viewYear = year + "년도";
		listModel.setDate(year);
		listModel.setViewDate(viewYear);
		
		mav.addObject("listModel", listModel);
		
		return mav;
		
	}
	
	@RequestMapping(value = "master/sale_status_month_default.do", method = RequestMethod.POST)
	public ModelAndView post_Month_defaultForm(@RequestParam(value = "status_year") String year,
										@RequestParam(value = "status_st_name", required = false) String st_name){
		ModelAndView mav = new ModelAndView("/master/sale_status_month_default");
		
		SaleDaySearch saleYearSearch = new SaleDaySearch();
		
		saleYearSearch.setDate(year);
		
		if(st_name != null){
			saleYearSearch.setSt_name(st_name);
		}
		
		StatsListModel listModel = statsService.getYearList(saleYearSearch);
		
		String viewYear = year + "년도";
		listModel.setDate(year);
		listModel.setViewDate(viewYear);
		
		mav.addObject("listModel", listModel);
		return mav;
	}
	
	
	
	@RequestMapping(value = "master/sale_status_month_detail.do", method = RequestMethod.GET)
	public ModelAndView get_Month_detailForm(	HttpServletRequest request,
												@RequestParam(value = "status_date") String year,
												@RequestParam(value = "status_st_num") int st_num,
												@RequestParam(value = "status_totalProfit") int totalProfit,
												@RequestParam(value = "status_st_name") String st_name) throws SQLException, IOException{
		ModelAndView mav = new ModelAndView("/master/sale_status_month_detail");
		
		String path = request.getSession().getServletContext().getRealPath("images");  
		
		SaleDaySearch saleYearSearch = new SaleDaySearch();
		
		saleYearSearch.setDate(year);
		saleYearSearch.setSt_num(st_num);
		
		String viewDate = year + "년도";
		StatsListModel listModel = statsService.getEachYearStoreList(saleYearSearch);
		
		String paths  = statsService.getStats_graph(path, saleYearSearch);  
		
		listModel.setDate(year);
		listModel.setViewDate(viewDate);
		listModel.setTotalProfit(totalProfit);
		listModel.setSt_name(st_name);
		
		mav.addObject("paths", paths);
		mav.addObject("listModel", listModel);
		return mav;
		
	}
	
	
	@RequestMapping(value = "master/sale_status_month_graphic.do", method = RequestMethod.GET)
	public ModelAndView get_Month_Graphic_Form() throws SQLException, IOException{
		
		ModelAndView mav = new ModelAndView("/master/sale_status_month_graphic_default");
		return mav;
	}
	
	
	
	@RequestMapping(value = "master/sale_status_month_graphic.do", method = RequestMethod.POST)
	public ModelAndView post_Month_Graphic_Form(HttpServletRequest request, 
											@RequestParam(value = "status_year") String year,
											@RequestParam(value = "status_st_name") int st_num
											) throws SQLException, IOException{
		
		ModelAndView mav = new ModelAndView("/master/sale_status_month_graphic_result");
	
		String path = request.getSession().getServletContext().getRealPath("images"); 
		
		SaleDaySearch saleYearSearch = new SaleDaySearch();
		
		saleYearSearch.setDate(year);
		saleYearSearch.setSt_num(st_num);
		
		String paths  = statsService.getStats_graph(path, saleYearSearch);
		
		
		String viewDate = year + "년도";
		StatsListModel listModel = new StatsListModel();
		listModel.setDate(year);
		listModel.setViewDate(viewDate);
		
		mav.addObject("paths", paths);
		
		return mav;
		
	}
	
	

	//2011년2월1일 : viewDate필드를 만들기 위한 메서드
	public String viewDateMk(String date){
		
		String str = date;
		String year = null;
		String month = null;
		String day = null;
		StringTokenizer st = new StringTokenizer(str,"/");
		if(st.hasMoreTokens()){
			year = st.nextToken();
		}
		str = str.substring(year.length() + 1);
		st = new StringTokenizer(str,"/");
		if(st.hasMoreTokens()){
			month = st.nextToken();
		}
		str = str.substring(month.length() + 1);
		st = new StringTokenizer(str,"/");
		if(st.hasMoreTokens()){
			day = st.nextToken();
		}
		String viewDate = year + "년 " + month + "월 " + day + "일";
		return viewDate;
	}
}
