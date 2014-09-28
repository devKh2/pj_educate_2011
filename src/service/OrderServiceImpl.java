package service;

import java.sql.SQLException;
import java.util.ArrayList;

import model.Cart;
import model.OrderListRequest;
import model.OrderModel;
import model.SearchParam;
import dao.OrderDao;

public class OrderServiceImpl implements OrderService{

	OrderDao orderDao;

	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	@Override
	public void insertCart(String userid,ArrayList<OrderModel> modellist) throws SQLException {
		// TODO Auto-generated method stub
		orderDao.insertCart(userid, modellist);
	}
	
	@Override
	public ArrayList<Cart> getCartList(String userid) throws SQLException {
		return orderDao.getCartList(userid);
	}

	@Override
	public int deleteCart(String userid, ArrayList<OrderModel> modellist)throws SQLException {
		orderDao.deleteCart(userid, modellist);
		return 0;
	}

	@Override
	public ArrayList<OrderModel> getOrderlist(String userid, String order_id)
			throws SQLException {
		if(userid!=null && order_id==null){
			return orderDao.getOrderlist(userid, null);
		}else if(userid==null && order_id!=null){
			return orderDao.getOrderlist(null, order_id);
		}
		return null;
	}

	@Override
	public int insertOrder(String userid,ArrayList<OrderModel> modellist) throws SQLException {
		return orderDao.orderInsert(userid, modellist);
	}
	
	public OrderListRequest getOrdersList(SearchParam searParam) throws SQLException{
		int totalOrderModelCount = orderDao.getOrdersCount(searParam);

		if (totalOrderModelCount == 0) {
			return new OrderListRequest();
		}
		
		//검색된 row 수로 전체 결과 페이지 수 결정.
		int totalPageCount;
		
		int firstRow;
		int endRow;
		
		//검색된 row 수로 전체 결과 페이지 수 결정.(각 페이지당 5개 row) 
		totalPageCount = calculateTotalPageCount(totalOrderModelCount, 10);
		//통합검색 후 section 당 로우 개수(5 개)로 시작과 끝 로우 결정. 
		firstRow = calculateFirstRow(searParam.getP(), 10);
		endRow = calculateEndRow(firstRow, 10, totalOrderModelCount);
		searParam.setFirstRow(firstRow);
		searParam.setEndRow(endRow);

		OrderListRequest orderListView = new OrderListRequest(
				orderDao.getOrdersList(searParam), searParam.getP(), totalPageCount, firstRow,
				endRow, totalOrderModelCount, 10);
		
		return orderListView;
		
	}
	public OrderListRequest getUserOrdersList(SearchParam searParam) throws SQLException{
		int totalOrderModelCount = orderDao.getUserOrdersCount(searParam.getKw());

		if (totalOrderModelCount == 0) {
			return new OrderListRequest();
		}
		
		//검색된 row 수로 전체 결과 페이지 수 결정.
		int totalPageCount;
		
		int firstRow;
		int endRow;
		
		//검색된 row 수로 전체 결과 페이지 수 결정.(각 페이지당 5개 row) 
		totalPageCount = calculateTotalPageCount(totalOrderModelCount, 10);
		//통합검색 후 section 당 로우 개수(5 개)로 시작과 끝 로우 결정. 
		firstRow = calculateFirstRow(searParam.getP(), 10);
		endRow = calculateEndRow(firstRow, 10, totalOrderModelCount);
		searParam.setFirstRow(firstRow);
		searParam.setEndRow(endRow);

		OrderListRequest orderListView = new OrderListRequest(
				orderDao.getOrdersList(searParam), searParam.getP(), totalPageCount, firstRow,
				endRow, totalOrderModelCount, 10);
		
		return orderListView;
		
	}
	
	/**
	 * 검색 결과에서 첫번째 row 구하기.
	 * @param requestPageNumber
	 * @param count_per_page
	 * @return
	 */
	private int calculateFirstRow(int requestPageNumber, int count_per_page) {
		int firstRow = (requestPageNumber - 1) * count_per_page + 1;
		return firstRow;
	}
	
	/**
	 * 검색 결과에서  마지막 row 구하기.
	 * @param firstRow
	 * @param count_per_page
	 * @param totalStoreModelCount
	 * @return
	 */
	private int calculateEndRow(int firstRow, int count_per_page, int totalStoreModelCount) {
		int endRow = firstRow + count_per_page - 1;
		
		if (endRow > totalStoreModelCount) {
			endRow = totalStoreModelCount;
		}
		return endRow;
	}
	
	/**
	 * 한페이지당 row 개수로 전체 페이지 수 구하기.
	 * @param totalMenuCount
	 * @param count_per_page
	 * @return
	 */
	private int calculateTotalPageCount(int totalMenuCount, int count_per_page) {
		if (totalMenuCount == 0) {
			return 0;
		}
		int pageCount = totalMenuCount / count_per_page;
		if (totalMenuCount % count_per_page > 0) {
			pageCount++;
		}
		return pageCount;
	}

}
