package com.myebook.homepage.book.db;

public class OrderDetailsDTO {

	/*
	 * create table order_details( orderDetailsNum int not null, odid int null, bkid
	 * int not null, cartStock int not null, primary key(orderDetailsNum)); alter
	 * table order_details add constraint fk_od1 foreign key(odid) references
	 * bookorder(odid);
	 */

	private int orderDetailsNum;
	private String odid;
	private int bkid;
	private int cartStock;
	private String user_id;

	public int getOrderDetailsNum() {
		return orderDetailsNum;
	}

	public void setOrderDetailsNum(int orderDetailsNum) {
		this.orderDetailsNum = orderDetailsNum;
	}

	public String getOdid() {
		return odid;
	}

	public void setOdid(String odid) {
		this.odid = odid;
	}

	public int getBkid() {
		return bkid;
	}

	public void setBkid(int bkid) {
		this.bkid = bkid;
	}

	public int getCartStock() {
		return cartStock;
	}

	public void setCartStock(int cartStock) {
		this.cartStock = cartStock;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

}
