package com.myebook.homepage.book.db;

public class BookDTO {

//	    bkid int auto_increment primary key comment '책 식별번호',
//	    id int(11) comment '외래키',
//	    bookname varchar(50) not null comment '책 이름',
//	    cate_cd varchar(20) default '없음' comment '책 카테고리',
//	    price varchar(10) not null comment '책 가격',
//	    gdsDes varchar(500) null comment '책 설명',
//	    gdsImg varchar(200) null comment '책 이미지',
//	    reg_dt date null comment '등록날짜',
//	    sellingtype varchar(10) comment '상품 판매 유형 1, 단권판매 2, 회차당판매 3, 둘 다 ',

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
	private String cate_cd;
	private String cate_cdRef;
	private int gdsStock;
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

	public int getGdsStock() {
		return gdsStock;
	}

	public void setGdsStock(int gdsStock) {
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

	public String getCate_cd() {
		return cate_cd;
	}

	public void setCate_cd(String cate_cd) {
		this.cate_cd = cate_cd;
	}

}
