package com.myebook.homepage.book.db;

public class OrderDTO {

	/*
	 * create table bookorder( odid int auto_increment primary key comment '주문번호',
	 * id int(11) null comment '유저 아이디', orderRec varchar(50) not null comment
	 * '주문자', userAddr1 varchar(50) not null comment '우편주소', userAddr2  varchar(50)
	 * not null comment '기본주소', userAddr3  varchar(50) not null comment '상세주소',
	 * orderPhon varchar(30) not null comment '연락처', amount int not null comment
	 * '총가격', orderDate Date comment '주문날짜'); alter table bookorder add constraint
	 * fk_bo1 foreign key(id) references member(id);
	 */

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
