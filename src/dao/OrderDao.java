package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Cart;
import model.OrderModel;
import model.OrderRequest;
import model.SearchParam;

public interface OrderDao {
	public int orderInsert(String userid,ArrayList<OrderModel> modellist) throws SQLException;
	public int insertCart(String userid,ArrayList<OrderModel> modellist) throws SQLException;
	public ArrayList<Cart> getCartList(String userid) throws SQLException;
	public int deleteCart(String userid,ArrayList<OrderModel> modellist)throws SQLException;
	public ArrayList<OrderModel> getOrderlist(String userid,String order_id)throws SQLException;
	List<OrderRequest> getOrdersList(SearchParam searParam) throws SQLException;
	int getOrdersCount(SearchParam searParam) throws SQLException;
	
	public int getUserOrdersCount(String userid) throws SQLException;

}
