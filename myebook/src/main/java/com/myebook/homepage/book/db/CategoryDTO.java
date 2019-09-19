package com.myebook.homepage.book.db;

public class CategoryDTO {
	
	//	cate_name varchar(20) not null,
	//	cate_cd varchar(20) not null primary key comment '책 카테고리',
	//	cate_cdRef varchar(20)  comment '카테고리 2차 분류',
	
	private int level;	
	private String cate_name;
	private String cate_cd;
	private String cate_cdRef;

	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}
	public String getCate_cd() {
		return cate_cd;
	}
	public void setCate_cd(String cate_cd) {
		this.cate_cd = cate_cd;
	}
	public String getCate_cdRef() {
		return cate_cdRef;
	}
	public void setCate_cdRef(String cate_cdRef) {
		this.cate_cdRef = cate_cdRef;
	}
	
}
