package com.myebook.homepage.book.db;

public class CartDTO {
	
/*cartNum int auto_increment comment '카트 고유 번호',
  user_id varchar(12) not null comment '카트 고유 번호',
  bkid int not null comment '상품번호',
  cartStock int not null comment '수량',
  addDate date not null,
  primary key(cartNum, user_id) */
	
	private int cartNum;
	private String user_id;
	private int bkid;
	private int cartStock;
	private String date;
	
	public int getCartNum() {
		return cartNum;
	}
	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}

}
