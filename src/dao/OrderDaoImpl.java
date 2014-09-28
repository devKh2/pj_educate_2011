package dao;

import org.apache.log4j.Logger;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.net.Socket;
import java.net.UnknownHostException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.Cart;
import model.MenuModel;
import model.OrderModel;
import model.StoreModel;
import model.OrderRequest;
import model.SearchParam;

import com.ibatis.sqlmap.client.SqlMapClient;

public class OrderDaoImpl implements OrderDao {

	SqlMapClient sqlMapClient;
	static Logger logger = Logger.getLogger(OrderDaoImpl.class);

	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}

	public OrderDaoImpl() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public ArrayList<Cart> getCartList(String userid) throws SQLException {
		return (ArrayList<Cart>) sqlMapClient.queryForList("order.getCartList",
				userid);
	}

	@Override
	public int deleteCart(String userid, ArrayList<OrderModel> modellist)
			throws SQLException {
		Map<String, String> params = new HashMap<String, String>();
		params.put("userid", userid);
		for (OrderModel model : modellist) {
			params.put("stnum", String.valueOf(model.getSt_num()));
			params.put("menunum", model.getMenu_num());
			sqlMapClient.delete("order.deleteCart", params);
		}
		return 0;
	}

	@Override
	public int insertCart(String userid, ArrayList<OrderModel> modellist)
			throws SQLException {
		Map<String, String> params = new HashMap<String, String>();
		params.put("userid", userid);
		for (OrderModel model : modellist) {
			params.put("stnum", model.getSt_num());
			params.put("menunum", model.getMenu_num());
			params.put("menuname", model.getMenu_name());
			params.put("quentity", model.getQuantity());
			params.put("price", String.valueOf(model.getMenu_price()));
			// Cart에 메뉴 정보가 존재하지 않으면 카트에 인서트
			if (sqlMapClient.queryForObject("order.existCart", params) == null)
				sqlMapClient.insert("order.addCart", params);
			else {
				// Cart에 메뉴정보가 존재하면 업데이트.
				sqlMapClient.update("order.updateCart", params);
			}
		}
		return 0;
	}

	public int orderInsert(String userid, ArrayList<OrderModel> modellist)
			throws SQLException {
		Map<String, String> params = new HashMap<String, String>();
		logger.debug("인서트 진입");
		// 주문 테이블에 유저 정보를 삽입한다.
		// 리턴 값으로 주문번호를 받아온다.
		Map<String, String> params2 = new HashMap<String, String>();
		params2.put("user_id", userid);
		params2.put("comments", modellist.get(0).getOrder_comments());
		String str = modellist.get(0).getPreAddress();
		str = modellist.get(0).getPreAddress().replace(" ", "");
		str += modellist.get(0).getTailAddress().trim();
		params2.put("address", str);
		params2.put("state", "주문");
		int ordernum = (Integer) sqlMapClient.insert("order.orderAdd", params2);
		// 판매 테이블에 주문 번호를 삽입한다.
		// 리턴 값으로 판매번호를 받아온다.
		params2.clear();
		params2.put("ordernum", String.valueOf(ordernum));

		int salenum = (Integer) sqlMapClient.insert("sale.addSale", params2);
		// 주문 디테일 테이블에 주문정보를 추가한다.
		int ret = 0;
		params.put("ordernum", String.valueOf(ordernum));
		params.put("salenum", String.valueOf(salenum));
		for (OrderModel model : modellist) {
			params.put("stnum", String.valueOf(model.getSt_num()));
			params.put("menunum", model.getMenu_num());
			params.put("quantity", String.valueOf(model.getQuantity()));
			params.put("orderstatus", "주문");
			int seq = (Integer) sqlMapClient.insert("order.orderdetailAdd",
					params);
			ret = sendOrder(String.valueOf(seq), String.valueOf(model.getSt_num()));
		}
		return ret;
	}

	@Override
	public ArrayList<OrderModel> getOrderlist(String userid, String order_id)
			throws SQLException {
		if (userid != null && order_id == null) {
			ArrayList<String> ordernum = (ArrayList<String>) sqlMapClient
					.queryForList("order.getordernumlist", userid);
			if (ordernum == null) {
				return null;
			}
			ArrayList<OrderModel> modelist = new ArrayList<OrderModel>();
			for (String i : ordernum) {
				modelist.addAll((ArrayList<OrderModel>) sqlMapClient
						.queryForList("order.getOrderList", i));
			}
			return modelist;
		} else if (userid == null && order_id != null) {
			return (ArrayList<OrderModel>) sqlMapClient.queryForList(
					"order.getOrderList", order_id);
		}
		return null;
	}

	public List<OrderRequest> getOrdersList(SearchParam searParam)
			throws SQLException {
		List<OrderRequest> list = sqlMapClient.queryForList(
				"order.getOrdersList", searParam);
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setOrderList(
					sqlMapClient.queryForList("order.getOrdersDetailList", list
							.get(i).getOrder_num()));
		}
		return list;
	}

	// 유저 판매 리스트 부분
	public int getUserOrdersCount(String userid) throws SQLException {
		return (Integer) sqlMapClient.queryForObject(
				"order.getUserOrdersCount", userid);
	}

	public List<OrderRequest> getUserOrdersList(SearchParam searParam)
			throws SQLException {
		List<OrderRequest> list = sqlMapClient.queryForList(
				"order.getOrdersList", searParam);
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setOrderList(
					sqlMapClient.queryForList("order.getOrdersDetailList", list
							.get(i).getOrder_num()));
		}
		return list;
	}

	// 유저 판매 리스트 끝
	public int getOrdersCount(SearchParam searParam) throws SQLException {
		return (Integer) sqlMapClient.queryForObject("order.getOrdersCount",
				searParam);
	}

	// 전송
	private int sendOrder(String seq, String stnum) {
		try {
			String ip = (String) sqlMapClient.queryForObject(
					"store.getIpaddress", stnum);
			if (ip == null) {
				return 1;
			} else {
				Socket sock = new Socket(ip, 4242);
				OutputStreamWriter writer = new OutputStreamWriter(
						sock.getOutputStream());
				writer.write(seq);
				writer.flush();
				writer.close();
				sock.close();
			}
			
		} catch (UnknownHostException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	/*
	 * public static void main(String[] args) { OrderDaoImpl ddd=new
	 * OrderDaoImpl(); ddd.sendOrder("500", "3"); }
	 */
}
