package service;

import java.sql.SQLException;
import java.util.ArrayList;

import model.Cart;
import model.OrderListRequest;
import model.OrderModel;
import model.SearchParam;

public interface OrderService {
	public int insertOrder(String userid,ArrayList<OrderModel> modellist)throws SQLException ;
	public void insertCart(String userid,ArrayList<OrderModel> modellist)throws SQLException;
	public ArrayList<Cart> getCartList(String userid) throws SQLException;
	public int deleteCart(String userid,ArrayList<OrderModel> modellist) throws SQLException ;
	OrderListRequest getOrdersList(SearchParam searParam) throws SQLException;
	public OrderListRequest getUserOrdersList(SearchParam searParam) throws SQLException;
	public ArrayList<OrderModel> getOrderlist(String userid,String order_id) throws SQLException;
}
