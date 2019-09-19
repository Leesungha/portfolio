package com.myebook.homepage.book.db;

public class BookCateDTO {

	private int bkid;
	private int id;
	private String bookname;
	private int level;
	private int cate_name;
	private String price;
	private String gdsDes;
	private String gdsImg;
	private String reg_dt;
	private String sellingtype;
	private String thumbImg;
	private String gdsStock;
	private int likey;
	private float star;

	public float getStar() {
		return star;
	}

	public void setStar(float star) {
		this.star = star;
	}

	public int getLikey() {
		return likey;
	}

	public void setLikey(int likey) {
		this.likey = likey;
	}

	public String getGdsStock() {
		return gdsStock;
	}

	public void setGdsStock(String gdsStock) {
		this.gdsStock = gdsStock;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getCate_name() {
		return cate_name;
	}

	public void setCate_name(int cate_name) {
		this.cate_name = cate_name;
	}

	public String getThumbImg() {
		return thumbImg;
	}

	public void setThumbImg(String thumbImg) {
		this.thumbImg = thumbImg;
	}

	public String getCate_cdRef() {
		return cate_cdRef;
	}

	public void setCate_cdRef(String cate_cdRef) {
		this.cate_cdRef = cate_cdRef;
	}

	private String cate_cdRef;

	public int getBkid() {
		return bkid;
	}

	public void setBkid(int bkid) {
		this.bkid = bkid;
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

	public String getGdsDes() {
		return gdsDes;
	}

	public void setGdsDes(String gdsDes) {
		this.gdsDes = gdsDes;
	}

	public String getGdsImg() {
		return gdsImg;
	}

	public void setGdsImg(String gdsImg) {
		this.gdsImg = gdsImg;
	}

	public String getReg_dt() {
		return reg_dt;
	}

	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}

	public String getSellingtype() {
		return sellingtype;
	}

	public void setSellingtype(String sellingtype) {
		this.sellingtype = sellingtype;
	}

}
