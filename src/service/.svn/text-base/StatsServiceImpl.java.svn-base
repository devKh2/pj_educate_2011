package service;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import org.apache.log4j.Logger;
import org.jfree.chart.ChartRenderingInfo;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.CategoryLabelPositions;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.axis.ValueAxis;
import org.jfree.chart.entity.StandardEntityCollection;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.renderer.category.BarRenderer3D;
import org.jfree.data.category.DefaultCategoryDataset;
import controller.MasterSaleController;
import dao.StatsDao;
import model.SaleDaySearch;
import model.StatsListModel;
import model.DayOfStats_Total;

public class StatsServiceImpl implements StatsService {

	private StatsDao statsDao;

	public void setStatsDao(StatsDao statsDao) {
		this.statsDao = statsDao;
	}

	static Logger logger = Logger.getLogger(MasterSaleController.class);

	// 전체가게 하루매출리스트
	public StatsListModel getList(SaleDaySearch saleDaySearch) {

		List<DayOfStats_Total> totalStatsList = null;
		int result = 0;
		StatsListModel statsListView = null;

		try {
			logger.debug("StatsServiceImpl의 getList메서드 실행");
			result = statsDao.selectCount(saleDaySearch);
			if (result == 0) {
				return new StatsListModel();
			}

			logger.debug("StatsServiceImpl의 select메서드 실행");
			totalStatsList = statsDao.select(saleDaySearch);
			statsListView = new StatsListModel(totalStatsList);

			return statsListView;

		} catch (SQLException e) {
			throw new RuntimeException("DB 에러 발생:" + e.getMessage(), e);
		}
	}

	// 어느 한 가게의 하루 매출리스트
	public StatsListModel geteachStoreList(SaleDaySearch saleDaySearch) {
		List<DayOfStats_Total> totalStatsList = null;
		int result = 0;
		StatsListModel statsListView = null;

		try {
			logger.debug("StatsServiceImpl의 geteachStoreList메서드 실행");
			result = statsDao.selecteachStoreCount(saleDaySearch);
			if (result == 0) {
				return new StatsListModel();
			}

			logger.debug("StatsServiceImpl의 select메서드 실행");
			totalStatsList = statsDao.selecteachStore(saleDaySearch);
			statsListView = new StatsListModel(totalStatsList);

			return statsListView;

		} catch (SQLException e) {
			throw new RuntimeException("DB 에러 발생:" + e.getMessage(), e);
		}
	}

	public StatsListModel getYearList(SaleDaySearch saleDaySearch) {

		List<DayOfStats_Total> totalStatsList = null;
		int result = 0;
		StatsListModel statsListView = null;

		try {
			logger.debug("StatsServiceImpl의 getList메서드 실행");
			result = statsDao.selectYearCount(saleDaySearch);
			if (result == 0) {
				return new StatsListModel();
			}

			logger.debug("StatsServiceImpl의 select메서드 실행");
			totalStatsList = statsDao.selectYear(saleDaySearch);
			statsListView = new StatsListModel(totalStatsList);

			return statsListView;

		} catch (SQLException e) {
			throw new RuntimeException("DB 에러 발생:" + e.getMessage(), e);
		}
	}

	public StatsListModel getEachYearStoreList(SaleDaySearch saleDaySearch) {
		List<DayOfStats_Total> totalStatsList = null;
		int result = 0;
		StatsListModel statsListView = null;

		try {
			logger.debug("StatsServiceImpl의 geteachStoreList메서드 실행");
			result = statsDao.selectYearEachStoreCount(saleDaySearch);
			if (result == 0) {
				return new StatsListModel();
			}

			logger.debug("StatsServiceImpl의 select메서드 실행");
			totalStatsList = statsDao.selectYearEchStore(saleDaySearch);
			statsListView = new StatsListModel(totalStatsList);

			return statsListView;

		} catch (SQLException e) {
			throw new RuntimeException("DB 에러 발생:" + e.getMessage(), e);
		}
	}

	public String getStats_graph(String path, SaleDaySearch saleDaySearch) throws SQLException, IOException {
		
		List<DayOfStats_Total> list = statsDao.selectYearEchStore(saleDaySearch);

		// list가 있는 달은 1을 넣고 없는 달은 0을 넣는 로직
		int[] hasList = new int[12];
		
		for(int i = 0; i < 12; i++){
			for(int j = 0; j <list.size() ; j++){
				if( i+1 == Integer.valueOf(list.get(j).getMonthly().substring(3,4))){
					hasList[i] = 1;
					break;
				}
				else{ 
					hasList[i] = 0;
				}		
			}
		}

		// 차트 그리는 로직
		for (DayOfStats_Total stats : list) {
			System.out.println(stats.toString());
		}

		String st_num = String.valueOf(saleDaySearch.getSt_num());   //가게 번호(st_num)

		// --1)차트에 들어갈 데이터를 Dataset에 저장한다.
		int j = 0;
		DefaultCategoryDataset dataset = new DefaultCategoryDataset();
		for(int i = 1; i<hasList.length+1; i++){	
			if(hasList[i-1] == 1){
				dataset.addValue(list.get(j).getTotalProfit(), st_num, list.get(j).getMonthly());
				j++;
			}
			else
				dataset.addValue(0, st_num, list.get(0).getMonthly().substring(0, 3) + String.valueOf(i));
		}

		// --2)차트의 타입을 render로 지정
		BarRenderer3D render = new BarRenderer3D(4, 4);
		// X축의 Name을 지정
		CategoryAxis xAxis = new CategoryAxis("");
		//카테고리명을 비스듬히 나오게 한다.
		//xAxis.setCategoryLabelPositions(CategoryLabelPositions.createUpRotationLabelPositions(Math.PI / 5.0));
																	
		// Y축의 Name을 지정
		ValueAxis yAxis = new NumberAxis("");

		// --3)Category관련 Plot을 설정
		CategoryPlot plot = new CategoryPlot(dataset, xAxis, yAxis, render);
		
		String title = "20" + saleDaySearch.getDate() + "년" + list.get(0).getSt_name() + "매출액 비교";
		
		//제목
		JFreeChart chart = new JFreeChart(title, JFreeChart.DEFAULT_TITLE_FONT, plot, false);
		
		chart.setBackgroundPaint(java.awt.Color.white);
		chart.setBorderPaint(java.awt.Color.black);
		
		// --4_1)위의 차트 결과를 프레임을 이용해 Output한다
		// ChartFrame frame = new ChartFrame("BarChart", chart);
		// frame.pack();
		// System.out.println(" 높이 : " + frame.getHeight() + "넓이" +
		// frame.getWidth());
		// frame.setVisible(true);

		// --4_2)위의 차트 결과를 파일로 저장하자
		ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());

		// 파일 경로 및 이름 설정
		String image = "chart01.png";
		String paths = path + File.separator;


		File file = new File(paths);
		if (!file.exists()) {
			file.mkdirs();
		}
		System.out.println(paths + image);
		ChartUtilities.saveChartAsJPEG(new File(paths + image), chart, 688, 400, info);

		return paths + image;
		

	}
}
