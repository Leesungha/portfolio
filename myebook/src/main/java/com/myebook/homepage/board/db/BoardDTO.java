package com.myebook.homepage.board.db;

public class BoardDTO {
	
	public int bid; // 게시판 번호
	public int id; // 멤버 아이디
	public String cate_cd; // 카테고리
	public String title; // 제목
	public String content; // 내용
	public String tag; // 태그
	public int view_cnt; // 조회수
	public String user_id; // 멤버 유저 아이디
	public String nickname; // 멤버 닉네임
	public String reg_dt; // 등록일
	public String edit_dt; // 수정일
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
//	public String getCate_cd() {
//		return cate_cd;
//	}
//	public void setCate_cd(String cate_cd) {
//		this.cate_cd = cate_cd;
//	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public int getView_cnt() {
		return view_cnt;
	}
	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
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
	public String getEdit_dt() {
		return edit_dt;
	}
	public void setEdit_dt(String edit_dt) {
		this.edit_dt = edit_dt;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCate_cd() {
		return cate_cd;
	}
	public void setCate_cd(String cate_cd) {
		this.cate_cd = cate_cd;
	}
	
}
