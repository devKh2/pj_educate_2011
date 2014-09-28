package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import model.DayOfStats_Total;
import model.SaleDaySearch;
import model.StatsListModel;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import service.StatsService;

@Controller
public class MemberController {
	
	StatsService statsService;
	
	
	
	public void setStatsService(StatsService statsService) {
		this.statsService = statsService;
	}


	@RequestMapping(value = "/st_sale.do", method = RequestMethod.GET)
	public ModelAndView get_Month_detailForm(
												@RequestParam(value = "st_num") int st_num,
												@RequestParam(value = "st_name") String st_name,HttpServletRequest request) throws SQLException, IOException{
		ModelAndView mav = new ModelAndView("/store/sale_month_detail");
		
		String path = request.getSession().getServletContext().getRealPath("images");  
		System.out.println("컨트롤러:"+path);
		SaleDaySearch saleYearSearch = new SaleDaySearch();
		
		Calendar cal = Calendar.getInstance();
		String year = String.valueOf(cal.get(Calendar.YEAR));
		year = year.substring(2);
		System.out.println(year);
		saleYearSearch.setDate(year);
		saleYearSearch.setSt_num(st_num);
		
		String viewDate = year + "년도";
		StatsListModel listModel = statsService.getEachYearStoreList(saleYearSearch);
		
		String paths  = statsService.getStats_graph(path, saleYearSearch);
		
		int temp=0;
		for(DayOfStats_Total st:listModel.getStatsList()){
			temp+=st.getTotalProfit();
		}
		
		listModel.setDate(year);
		listModel.setViewDate(viewDate);
		listModel.setTotalProfit(temp);
		listModel.setSt_name(st_name);
		mav.addObject("paths", paths);
		mav.addObject("listModel", listModel);
		return mav;
	}
}
