package com.myebook.homepage.book.db;

public class ReplyDTO {

	/*
	 * create table bookreview ( bkid int auto_increment comment '상품번호' primary key,
	 * id int(11) comment '아이디', rid int not null comment '댓글 소감 번호', content text
	 * null comment '댓글내용', nickname varchar(12) not null comment '닉네임', user_id
	 * varchar(12), reg_dt date not null comment '작성일', constraint fk_bkr1 foreign
	 * key( id ) references member ( id ) on delete set null);
	 */

	private int bkid;
	private int id;
	private int rid;
	private String content;
	private String nickname;
	private String user_id;
	private String reg_dt;
	private float star;

	public float getStar() {
		return star;
	}

	public void setStar(float star) {
		this.star = star;
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

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getReg_dt() {
		return reg_dt;
	}

	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}

}
