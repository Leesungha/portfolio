package com.myebook.homepage.book.db;

public class OrderListDTO {
	
	/*
	 * select o.odid, o.id, o.orderRec, o.userAddr1, o.userAddr2, o.userAddr3,
	o.orderPhon, o.amount, o.orderDate, o.delivery, d.orderDetailsNum, d.bkid, d.cartStock,
	b.bookname, b.thumbImg, b.price
	from bookorder o inner join order_details d 
		on o.odid = d.odid
	inner join book b 
		on d.bkid = b.bkid
	where o.odid = #{odid}
	 
	* */
	
	 private String odid;
	 private int id;
	 private String orderRec;
	 private String userAddr1;
	 private String userAddr2;
	 private String userAddr3;
	 private String orderPhon;
	 private int amount;
	 private String orderDate;
	 private String delivery;
	 
	 private int orderDetailsNum;
	 private int bkid;
	 private int cartStock;
	 private String user_id;
		 
	 private String bookname;
	 private String price;
	 private String thumbImg;
     private String gdsStock;
	 
    public String getGdsStock() {
		return gdsStock;
	}
	public void setGdsStock(String gdsStock) {
		this.gdsStock = gdsStock;
	}

	public int getOrderDetailsNum() {
		return orderDetailsNum;
	}
	public void setOrderDetailsNum(int orderDetailsNum) {
		this.orderDetailsNum = orderDetailsNum;
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
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getThumbImg() {
		return thumbImg;
	}
	public void setThumbImg(String thumbImg) {
		this.thumbImg = thumbImg;
	}
	public String getOdid() {
		return odid;
	}
	public void setOdid(String odid) {
		this.odid = odid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOrderRec() {
		return orderRec;
	}
	public void setOrderRec(String orderRec) {
		this.orderRec = orderRec;
	}
	public String getUserAddr1() {
		return userAddr1;
	}
	public void setUserAddr1(String userAddr1) {
		this.userAddr1 = userAddr1;
	}
	public String getUserAddr2() {
		return userAddr2;
	}
	public void setUserAddr2(String userAddr2) {
		this.userAddr2 = userAddr2;
	}
	public String getUserAddr3() {
		return userAddr3;
	}
	public void setUserAddr3(String userAddr3) {
		this.userAddr3 = userAddr3;
	}
	public String getOrderPhon() {
		return orderPhon;
	}
	public void setOrderPhon(String orderPhon) {
		this.orderPhon = orderPhon;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	 public String getDelivery() {
		return delivery;
	}
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}

}
