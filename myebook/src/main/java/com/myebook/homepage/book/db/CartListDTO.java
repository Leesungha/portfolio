package com.myebook.homepage.book.db;

public class CartListDTO {

	private int Num;
	private String user_id;
	private int bkid;
	private int cartStock;
	private String adddate;

	private int id;
	private String bookname;
	private String price;
	private String thumbImg;
	private String sellingtype;

	public String getSellingtype() {
		return sellingtype;
	}

	public void setSellingtype(String sellingtype) {
		this.sellingtype = sellingtype;
	}

	public int getNum() {
		return Num;
	}

	public void setCartNum(int Num) {
		this.Num = Num;
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

	public String getAdddate() {
		return adddate;
	}

	public void setAdddate(String adddate) {
		this.adddate = adddate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

}
