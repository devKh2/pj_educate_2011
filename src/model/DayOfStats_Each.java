package model;

public class DayOfStats_Each {

	private String menu_num;		// �޴���ȣ
	private String menu_name;		// �޴��̸�
	private int menu_price;			// �޴�����
	private int quantity;			// �ֹ���
	private int total;				// �޴����� * �ֹ���
	public String getMenu_num() {
		return menu_num;
	}
	public void setMenu_num(String menu_num) {
		this.menu_num = menu_num;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public int getMenu_price() {
		return menu_price;
	}
	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	
	@Override
	public String toString() {
		return "DayOfStats_Each [menu_num=" + menu_num + ", menu_name="
				+ menu_name + ", menu_price=" + menu_price + ", quantity="
				+ quantity + ", total=" + total + ", getMenu_num()="
				+ getMenu_num() + ", getMenu_name()=" + getMenu_name()
				+ ", getMenu_price()=" + getMenu_price() + ", getQuantity()="
				+ getQuantity() + ", getTotal()=" + getTotal() + "]";
	}
	
	
	
}
